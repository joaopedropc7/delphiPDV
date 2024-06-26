unit UnitAjusteEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  TfrmAjusteEstoque = class(TForm)
    pnlBottom: TPanel;
    pnlLeft: TPanel;
    pnlRight: TPanel;
    pnlTop: TPanel;
    pnlAllClient: TPanel;
    pnlTitulo: TPanel;
    lblTitulo: TLabel;
    pnlClientAjuste: TPanel;
    edtCodPro: TEdit;
    edtHistorico: TEdit;
    lblCodPro: TLabel;
    lblNmPro: TLabel;
    Label1: TLabel;
    edtSaldoAtual: TEdit;
    edtNovoSaldo: TEdit;
    lblNovoSaldo: TLabel;
    Button1: TButton;
    qryAjusteEstoque: TZQuery;
    edtNomePro: TEdit;
    lblHistorico: TLabel;
    procedure edtCodProExit(Sender: TObject);
    procedure edtCodProKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure edtNomeProKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);


  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmAjusteEstoque: TfrmAjusteEstoque;

implementation

uses UnitPrincipal, UnitCadastroProduto, UnitConsultaProdGeral,
  UnitProdutos;

{$R *.dfm}

procedure TfrmAjusteEstoque.edtCodProExit(Sender: TObject);
begin
  if Trim(edtCodPro.Text) = '' then
    Exit;

  qryAjusteEstoque.SQL.Text := 'SELECT ID, NOME, QUANTIDADE FROM PRODUTOS WHERE ID = :ID';
  qryAjusteEstoque.ParamByName('ID').AsInteger := StrToInt(edtCodPro.Text);
  qryAjusteEstoque.Open;

  if not qryAjusteEstoque.IsEmpty then
  begin
    edtNomePro.Text := qryAjusteEstoque.Fields[1].AsString;
    edtCodPro.Text := qryAjusteEstoque.Fields[0].AsString;
    edtSaldoAtual.Text := qryAjusteEstoque.Fields[2].AsString;
  end;
  if qryAjusteEstoque.IsEmpty then
  begin
  	edtNomePro.Text := '';
    edtCodPro.Text := '';
    edtSaldoAtual.Text := '';
  end;
end;

procedure TfrmAjusteEstoque.edtCodProKeyPress(Sender: TObject;
  var Key: Char);
begin
	if not (Key in ['0'..'9', #8]) then
    Key := #0;
  If key = #13 then
   Begin
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
   end;  
end;





procedure TfrmAjusteEstoque.Button1Click(Sender: TObject);
var novoSaldo: String;
begin
	if edtCodPro.Text = '' then
  begin
    ShowMessage('� necess�rio selecionar o produto!');
    Exit;
  end;
  if edtNovoSaldo.Text = '' then
  begin
		ShowMessage('� necess�rio preencher o novo saldo!');
    Exit;
  end;

  qryAjusteEstoque.SQL.Text := 'SELECT ID FROM PRODUTOS WHERE ID = :ID';
  qryAjusteEstoque.ParamByName('ID').AsInteger := StrToInt(edtCodPro.Text);
  qryAjusteEstoque.Open;

  if qryAjusteEstoque.IsEmpty then
  begin
  ShowMessage('Produto n�o encontrado!');
  Exit;
 	end;

	novoSaldo := edtNovoSaldo.Text;
  qryAjusteEstoque.SQL.Text := 'UPDATE PRODUTOS SET QUANTIDADE = :NOVOSALDO WHERE ID = :ID';
  qryAjusteEstoque.ParamByName('NOVOSALDO').AsInteger := StrToInt(edtNovoSaldo.Text);
  qryAjusteEstoque.ParamByName('ID').AsInteger := StrToInt(edtCodPro.Text);
  qryAjusteEstoque.ExecSQL;

  //UPDATE TABELA LAN�AMENTOS
  qryAjusteEstoque.SQL.Text := 'INSERT INTO LANCAMENTOS (PRODUTO_ID, HISTORICO, QUANTIDADE, DATAOPE, VALOR, TPMOV) VALUES ' +
	'(:PRODUTOID, :HISTORICO, :QUANTIDADE, :DATAOPE, :VALOR, :TPMOV)';

  qryAjusteEstoque.ParamByName('PRODUTOID').AsInteger := StrToInt(edtCodPro.Text);
  qryAjusteEstoque.ParamByName('HISTORICO').AsString := edtHistorico.Text;
  qryAjusteEstoque.ParamByName('QUANTIDADE').AsInteger := StrToInt(edtNovoSaldo.Text);
	qryAjusteEstoque.ParamByName('DATAOPE').AsDate := Date;
  qryAjusteEstoque.ParamByName('VALOR').AsFloat := 0.0;
	qryAjusteEstoque.ParamByName('TPMOV').AsString := 'C';

  qryAjusteEstoque.ExecSQL;

  ShowMessage('Saldo atualizado!');
  edtSaldoAtual.Text := novoSaldo;
  edtNovoSaldo.Text := '';



  qryAjusteEstoque.SQL.Text := 'SELECT ID, NOME FROM PRODUTOS WHERE ID = 1'

end;


procedure TfrmAjusteEstoque.edtNomeProKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var idDevolvido: Integer;
begin
  Application.CreateForm(TfrmConsultaProd, frmConsultaProd);
  try
  	frmConsultaProd.ShowModal;
  finally
		idDevolvido := frmConsultaProd.idSelecionado;
    if idDevolvido <> 0 then
    begin
      edtCodPro.Text := IntToStr(idDevolvido);
      edtCodPro.OnExit(Self);
      edtNovoSaldo.SetFocus;
      frmConsultaProd.Free;
    end;
  end;
end;

end.
