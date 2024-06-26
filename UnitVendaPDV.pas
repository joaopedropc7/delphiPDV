unit UnitVendaPDV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Grids, DBGrids, StdCtrls;

type
  TfrmVendaPDV = class(TForm)
    pnlBot: TPanel;
    pnlLeft: TPanel;
    pnlRight: TPanel;
    pnlTopo: TPanel;
    pnlAllClient: TPanel;
    pnlTopoClient: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    qryProdutosVenda: TZQuery;
    Panel4: TPanel;
    lblNomePro: TLabel;
    edtNomePro: TEdit;
    edtCdPro: TEdit;
    lblCdPro: TLabel;
    edtQuantidadePro: TEdit;
    lblQuantPro: TLabel;
    lblValorProd: TLabel;
    edtValorPro: TEdit;
    pnlAtalhos: TPanel;
    btnConfirmarProd: TButton;
    btnCancelarProd: TButton;
    btnFinalizarVenda: TButton;
    btnCancelarVenda: TButton;
    qryBuscarProdutos: TZQuery;
    qryInserirProdutoLan: TZQuery;
    procedure FormShow(Sender: TObject);
    procedure edtCdProExit(Sender: TObject);
    procedure edtNomeProKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCdProKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantidadeProKeyPress(Sender: TObject; var Key: Char);
    procedure btnConfirmarProdClick(Sender: TObject);
    procedure edtValorProKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFinalizarVendaClick(Sender: TObject);
    procedure btnCancelarVendaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    valorTotalVenda: Double;
    vendaCancelada: Boolean;
    procedure calculValorTotalVenda;
  end;

var
  frmVendaPDV: TfrmVendaPDV;

implementation

uses UnitVendas, UnitPrincipal, UnitConsultaProdGeral, UnitPagamentos,
  UnitTelaDesconto;

{$R *.dfm}

procedure TfrmVendaPDV.FormShow(Sender: TObject);
	var querySql: string;
begin
	querySql := 'SELECT VP.ID, P.NOME,  VP.QUANTIDADE, VP.VALOR_PROD ' +
'FROM VENDAS_PROD VP JOIN PRODUTOS P ON VP.PRODUTO_ID = P.ID ' +
' WHERE VP.VENDA_ID = :IDVENDA';
  qryProdutosVenda.SQL.Text := querySql;
  qryProdutosVenda.ParamByName('IDVENDA').AsInteger := frmVenda.vendaAtual;
  qryProdutosVenda.Active;
  qryProdutosVenda.Open;
  qryProdutosVenda.Refresh;
  calculValorTotalVenda;
end;

procedure TfrmVendaPDV.edtCdProExit(Sender: TObject);
begin
if Trim(edtCdPro.Text) = '' then
    Exit;

  qryBuscarProdutos.SQL.Text := 'SELECT ID, NOME, VALORVENDA, VALORPROMOCAO, PROMOCAO FROM PRODUTOS WHERE ID = :ID';
  qryBuscarProdutos.ParamByName('ID').AsInteger := StrToInt(edtCdPro.Text);
  qryBuscarProdutos.Open;

  if not qryBuscarProdutos.IsEmpty then
  begin
    edtCdPro.Text := qryBuscarProdutos.Fields[0].AsString;
    edtNomePro.Text := qryBuscarProdutos.Fields[1].AsString;
    edtValorPro.Text := qryBuscarProdutos.Fields[2].AsString;
    edtQuantidadePro.Text := '1';
  end;
  if qryBuscarProdutos.IsEmpty then
  begin
  	edtNomePro.Text := '';
    edtCdPro.Text := '';
    edtValorPro.Text := '';
    edtQuantidadePro.Text := '';
  end;
end;

procedure TfrmVendaPDV.edtNomeProKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var idDevolvido: Integer;
begin
  Application.CreateForm(TfrmConsultaProd, frmConsultaProd);
  try
  	frmConsultaProd.ShowModal;
  finally
		idDevolvido := frmConsultaProd.idSelecionado;
    if idDevolvido <> 0 then
    begin
      edtCdPro.Text := IntToStr(idDevolvido);
      edtCdPro.OnExit(Self);
      edtQuantidadePro.SetFocus;
      frmConsultaProd.Free;
    end;
  end;
end;

procedure TfrmVendaPDV.edtCdProKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure TfrmVendaPDV.edtQuantidadeProKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure TfrmVendaPDV.edtValorProKeyPress(Sender: TObject; var Key: Char);
begin
	if not (Key in ['0'..'9', #8, DecimalSeparator]) then
    Key := #0

  else if (Key = DecimalSeparator) and (Pos(DecimalSeparator, (Sender as TEdit).Text) > 0) then
    Key := #0;
end;



procedure TfrmVendaPDV.btnConfirmarProdClick(Sender: TObject);
var quantidade, cdpro: Integer;
var valorProd: Double;
var querySqlInsert, querySqlConsultaProd: String;
begin
  if edtQuantidadePro.Text = '' then
  begin
  	ShowMessage('� necess�rio que a quantidade seja maior que zero!');
    Exit;
  end;
   if edtCdPro.Text = '' then
  begin
  	ShowMessage('� necess�rio que o produto seja selecionado!');
    Exit;
  end;
  if edtValorPro.Text = '' then
  begin
  	ShowMessage('� necess�rio que a o valor de venda seja maior que zero!');
    Exit;    
  end;

	quantidade := StrToInt(edtQuantidadePro.Text);
	cdpro := StrToInt(edtCdPro.Text);
  valorProd := StrToFloat(edtValorPro.Text);

	if edtCdPro.Text = '' then
  begin
    ShowMessage('� necess�rio selecionar um produto!');
  end;

	if quantidade <= 0 then
  begin
    ShowMessage('� necess�rio que a quantidade seja maior que zero!');
  end;

  if valorProd <= 0 then
  begin
    ShowMessage('� necess�rio que o valor de venda seja maior que zero!');
  end;

  querySqlConsultaProd := 'SELECT * FROM PRODUTOS WHERE ID = :ID';
  qryBuscarProdutos.SQL.Text := querySqlConsultaProd;
  qryBuscarProdutos.ParamByName('ID').AsInteger := cdpro;
  qryBuscarProdutos.Open;

  if qryBuscarProdutos.IsEmpty then
  begin
  ShowMessage('Produto n�o encontrado!');
  Exit;
 	end;

  querySqlInsert := 'INSERT INTO VENDAS_PROD (QUANTIDADE, VALOR_PROD, PRODUTO_ID, VENDA_ID) VALUES (:QUANTIDADE, :VALORPROD, :PRODUTOID, :VENDAID)';
  qryInserirProdutoLan.SQL.Text := querySqlInsert;
	qryInserirProdutoLan.ParamByName('QUANTIDADE').AsInteger := quantidade;
  qryInserirProdutoLan.ParamByName('PRODUTOID').AsInteger := cdpro;
  qryInserirProdutoLan.ParamByName('VENDAID').AsInteger := frmVenda.vendaAtual;
	qryInserirProdutoLan.ParamByName('VALORPROD').AsFloat := valorProd;

  qryInserirProdutoLan.ExecSQL;

  qryProdutosVenda.Refresh;

  valorTotalVenda := valorTotalVenda + (quantidade * valorProd);
  Panel2.Caption := 'R$ ' + FormatFloat('0.00', valorTotalVenda);
  edtNomePro.Text := '';
  edtCdPro.Text := '';
  edtQuantidadePro.Text := '';
  edtValorPro.Text := '';



end;

procedure TfrmVendaPDV.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	if (not vendaCancelada)then
  begin
    MessageDlg('Finalize ou cancele a venda', mtWarning, [mbOK], 0);
  	Action := caNone;
    Exit;
  end;
  Action := caFree;
  frmVenda.alteraIdVendaParaUltima;
end;

procedure TfrmVendaPDV.btnFinalizarVendaClick(Sender: TObject);
var querySqlUpdate: String;
begin
	if valorTotalVenda <= 0 then
  begin
    MessageDlg('� necess�rio inserir produtos para finalizar a venda!', mtWarning, [mbOK], 0);
    exit;
  end;
  querySqlUpdate := 'UPDATE VENDAS SET VALOR = :VALOR, VLFINAL = :VLFINAL WHERE ID = :ID';
  qryBuscarProdutos.SQL.Text :=  querySqlUpdate;
  qryBuscarProdutos.ParamByName('VALOR').AsFloat := valorTotalVenda;
  qryBuscarProdutos.ParamByName('VLFINAL').AsFloat := valorTotalVenda;
  qryBuscarProdutos.ParamByName('ID').AsInteger := frmVenda.vendaAtual;
  qryBuscarProdutos.ExecSQL;
  //qryBuscarProdutos.SQL.Text := 'SELECT ID, NOME, VALORVENDA, VALORPROMOCAO, PROMOCAO FROM PRODUTOS WHERE ID = :ID';
  //qryBuscarProdutos.ParamByName('ID').AsInteger := StrToInt(edtCdPro.Text);
  //qryBuscarProdutos.Open;
	Application.CreateForm(TfrmDesconto, frmDesconto);
  try                                                     
		frmDesconto.ShowModal;
  finally
    frmDesconto.Free;
  end;
end;

procedure TfrmVendaPDV.btnCancelarVendaClick(Sender: TObject);
begin
	if MessageDlg('Tem certeza que deseja cancelar a venda?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
  begin
		Exit;
  end;
  qryInserirProdutoLan.SQL.Text := 'DELETE FROM VENDAS_PROD WHERE VENDA_ID = :ID';
  qryInserirProdutoLan.ParamByName('ID').AsInteger := frmVenda.vendaAtual;
  qryInserirProdutoLan.ExecSQL;

	qryInserirProdutoLan.SQL.Text := 'UPDATE VENDAS SET CANCEL = :CANCEL WHERE ID = :ID';
  qryInserirProdutoLan.ParamByName('ID').AsInteger := frmVenda.vendaAtual;
  qryInserirProdutoLan.ParamByName('CANCEL').AsString := 'S';
  qryInserirProdutoLan.ExecSQL;

  vendaCancelada := True;
  ShowMessage('Venda cancelada');

  Close;

end;

procedure TfrmVendaPDV.calculValorTotalVenda();
var produtoValorVenda: Double;
begin
  valorTotalVenda := 0;
  qryProdutosVenda.First;
  while not qryProdutosVenda.Eof do
  begin
    produtoValorVenda := qryProdutosVenda.FieldByName('VALOR_PROD').AsFloat;
    valorTotalVenda := valorTotalVenda + produtoValorVenda;
    qryProdutosVenda.Next;
  end;
  Panel2.Caption := 'R$ ' + FormatFloat('0.00', valorTotalVenda);

end;
procedure TfrmVendaPDV.FormActivate(Sender: TObject);
begin
  calculValorTotalVenda;
end;

end.

