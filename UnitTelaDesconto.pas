unit UnitTelaDesconto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, Mask, DBCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfrmDesconto = class(TForm)
    pnlTopo: TPanel;
    pnlRight: TPanel;
    pnlLeft: TPanel;
    pnlBot: TPanel;
    pnlAllClient: TPanel;
    pnlTitulo: TPanel;
    pnlAllClientDesconto: TPanel;
    lblDescontoPr: TLabel;
    Label1: TLabel;
    pnlBotaoConfirmar: TPanel;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    zqryDesconto: TZQuery;
    dbEdtDescPR: TDBEdit;
    dbEdtDescVL: TDBEdit;
    DataSource1: TDataSource;
    dbEdtValorCheio: TDBEdit;
    dbEdtValorFinal: TDBEdit;
    procedure edtDescontoPrKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure edtDescontoVlKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtDescontoPrExit(Sender: TObject);
    procedure edtDescontoVlExit(Sender: TObject);
    procedure verificaDesconto;
   
  private
    { Private declarations }
  public
    { Public declarations }
    valorDesconto, descontoPr, valorFinal, valorCheio: Double;
  end;

var
  frmDesconto: TfrmDesconto;

implementation

uses UnitVendaPDV, Math, UnitPagamentos, UnitPrincipal, UnitVendas;

{$R *.dfm}


procedure TfrmDesconto.edtDescontoPrKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (Key in ['0'..'9', #8, #13, #9, ',']) then
    Key := #0;


  if (Key = #13) OR (Key = #9) then
  begin
    Key := #0;

    if dbEdtDescPR.Text = '' then
      Exit;

    try
      descontoPr := StrToFloat(StringReplace(dbEdtDescPR.Text, ',', ',', [rfReplaceAll]));
    except
      on E: EConvertError do
      begin
        ShowMessage('Por favor, insira um valor numérico válido.');
        Exit;
      end;
    end;

    valorDesconto := (descontoPr * valorCheio) / 100;
    dbEdtDescVL.Text := FormatFloat('0.00', valorDesconto);
    valorFinal := valorCheio - valorDesconto;
    dbEdtValorFinal.Text := 'R$ ' + FormatFloat('0.00', valorFinal);

    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmDesconto.FormCreate(Sender: TObject);
begin
  zqryDesconto.SQL.Text := 'SELECT * FROM VENDAS WHERE ID = :ID;';
  zqryDesconto.ParamByName('ID').AsInteger := frmVenda.vendaAtual;
  zqryDesconto.Open;

  valorCheio := zqryDesconto.FieldByName('VALOR').AsFloat;
  //valorFinal := zqryDesconto.FieldByName('VLFINAL').AsFloat;
  KeyPreview := True;
end;

procedure TfrmDesconto.edtDescontoVlKeyPress(Sender: TObject;
  var Key: Char);
begin
	 if not (Key in ['0'..'9', #8, #13, #9, ',']) then
    Key := #0;


  if (Key = #13) OR (Key = #9) then
  begin
    Key := #0;

    if dbEdtDescVL.Text = '' then
      Exit;

    try
      valorDesconto := StrToFloat(StringReplace(dbEdtDescVL.Text, ',', ',', [rfReplaceAll]));
    except
      on E: EConvertError do
      begin
        ShowMessage('Por favor, insira um valor numérico válido.');
        Exit;
      end;
    end;

    descontoPr := (valorDesconto * 100) / valorCheio;
    descontoPr := RoundTo(descontoPr, -2);
    dbEdtDescPR.Text := FloatToStr(descontoPr);
    dbEdtDescVL.Text := FormatFloat('0.00', valorDesconto);
    valorFinal := valorCheio - valorDesconto;
    
    dbEdtValorFinal.Text := 'R$ ' + FormatFloat('0.00', valorFinal);


    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmDesconto.SpeedButton1Click(Sender: TObject);
begin

Application.CreateForm(TfrmPagamento, frmPagamento);
  try
		frmPagamento.ShowModal;
  finally
    frmPagamento.Free;
  end;
end;



procedure TfrmDesconto.edtDescontoPrExit(Sender: TObject);
begin
    if dbEdtDescPR.Text = '' then
      Exit;

    try
      descontoPr := StrToFloat(StringReplace(dbEdtDescPR.Text, ',', ',', [rfReplaceAll]));
    except
      on E: EConvertError do
      begin
        ShowMessage('Por favor, insira um valor numérico válido.');
        Exit;
      end;
    end;

    valorDesconto := (descontoPr * valorCheio) / 100;
    dbEdtDescVL.Text := FormatFloat('0.00', valorDesconto);
    valorFinal := valorCheio - valorDesconto;
    dbEdtValorFinal.Text := 'R$ ' + FormatFloat('0.00', valorFinal);

    Perform(WM_NEXTDLGCTL, 0, 0);
  end;


procedure TfrmDesconto.edtDescontoVlExit(Sender: TObject);
begin
	if dbEdtDescPR.Text = '' then
      Exit;

    try
      descontoPr := StrToFloat(StringReplace(dbEdtDescPR.Text, ',', ',', [rfReplaceAll]));
    except
      on E: EConvertError do
      begin
        ShowMessage('Por favor, insira um valor numérico válido.');
        Exit;
      end;
    end;

    valorDesconto := (descontoPr * valorCheio) / 100;
    dbEdtDescVL.Text := FormatFloat('0.00', valorDesconto);
    valorFinal := valorCheio - valorDesconto;
    dbEdtValorFinal.Text := 'R$ ' + FormatFloat('0.00', valorFinal);

    Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmDesconto.verificaDesconto;
var descontoPrConvertido, descontoVlConvertido: Double;
var querySqlText: string;
begin
  if (dbEdtDescPR.Text = '') and (dbEdtDescVL.Text = '') then
  begin
    Exit;
  end;
  descontoPrConvertido := StrToFloat(dbEdtDescPR.Text);
 	descontoVlConvertido := StrToFloat(dbEdtDescVL.Text);
	querySqlText := 'UPDATE VENDAS SET DESCPR = :DESCPR, DESCVL = :DESCVL WHERE VENDA_ID = :VENDAID';
  
end;

end.
