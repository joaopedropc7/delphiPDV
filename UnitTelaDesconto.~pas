unit UnitTelaDesconto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TfrmDesconto = class(TForm)
    pnlTopo: TPanel;
    pnlRight: TPanel;
    pnlLeft: TPanel;
    pnlBot: TPanel;
    pnlAllClient: TPanel;
    pnlTitulo: TPanel;
    pnlAllClientDesconto: TPanel;
    edtDescontoPr: TEdit;
    edtDescontoVl: TEdit;
    lblDescontoPr: TLabel;
    Label1: TLabel;
    pnlBotaoConfirmar: TPanel;
    SpeedButton1: TSpeedButton;
    edtValorFinal: TEdit;
    edtValorCheio: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    procedure edtDescontoPrKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure edtDescontoVlKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtDescontoPrExit(Sender: TObject);
    procedure edtDescontoVlExit(Sender: TObject);
   
  private
    { Private declarations }
  public
    { Public declarations }
    valorDesconto, descontoPr, valorFinal, valorCheio: Double;
  end;

var
  frmDesconto: TfrmDesconto;

implementation

uses UnitVendaPDV, Math, UnitPagamentos;

{$R *.dfm}


procedure TfrmDesconto.edtDescontoPrKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (Key in ['0'..'9', #8, #13, #9, ',']) then
    Key := #0;


  if (Key = #13) OR (Key = #9) then
  begin
    Key := #0;

    if edtDescontoPr.Text = '' then
      Exit;

    try
      descontoPr := StrToFloat(StringReplace(edtDescontoPr.Text, ',', ',', [rfReplaceAll]));
    except
      on E: EConvertError do
      begin
        ShowMessage('Por favor, insira um valor numérico válido.');
        Exit;
      end;
    end;

    valorDesconto := (descontoPr * valorCheio) / 100;
    edtDescontoVl.Text := FormatFloat('0.00', valorDesconto);
    valorFinal := valorCheio - valorDesconto;
    edtValorFinal.Text := 'R$ ' + FormatFloat('0.00', valorFinal);

    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmDesconto.FormCreate(Sender: TObject);
begin
	valorCheio := frmVendaPDV.valorTotalVenda;
  edtValorCheio.Text := 'R$' + FloatToStr(valorCheio);
  edtValorFinal.Text := 'R$ ' + FloatToStr(valorCheio);
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

    if edtDescontoVl.Text = '' then
      Exit;

    try
      valorDesconto := StrToFloat(StringReplace(edtDescontoVl.Text, ',', ',', [rfReplaceAll]));
    except
      on E: EConvertError do
      begin
        ShowMessage('Por favor, insira um valor numérico válido.');
        Exit;
      end;
    end;

    descontoPr := (valorDesconto * 100) / valorCheio;
    descontoPr := RoundTo(descontoPr, -2);
    edtDescontoPr.Text := FloatToStr(descontoPr);
    edtDescontoVl.Text := FormatFloat('0.00', valorDesconto);
    valorFinal := valorCheio - valorDesconto;
    edtValorFinal.Text := 'R$ ' + FormatFloat('0.00', valorFinal);

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
    if edtDescontoPr.Text = '' then
      Exit;

    try
      descontoPr := StrToFloat(StringReplace(edtDescontoPr.Text, ',', '.', [rfReplaceAll]));
    except
      on E: EConvertError do
      begin
        ShowMessage('Por favor, insira um valor numérico válido.');
        Exit;
      end;
    end;

    valorDesconto := (descontoPr * valorCheio) / 100;
    edtDescontoVl.Text := FormatFloat('0.00', valorDesconto);
    valorFinal := valorCheio - valorDesconto;
    edtValorFinal.Text := 'R$ ' + FormatFloat('0.00', valorFinal);

    Perform(WM_NEXTDLGCTL, 0, 0);
  end;


procedure TfrmDesconto.edtDescontoVlExit(Sender: TObject);
begin
	if edtDescontoPr.Text = '' then
      Exit;

    try
      descontoPr := StrToFloat(StringReplace(edtDescontoPr.Text, ',', '.', [rfReplaceAll]));
    except
      on E: EConvertError do
      begin
        ShowMessage('Por favor, insira um valor numérico válido.');
        Exit;
      end;
    end;

    valorDesconto := (descontoPr * valorCheio) / 100;
    edtDescontoVl.Text := FormatFloat('0.00', valorDesconto);
    valorFinal := valorCheio - valorDesconto;
    edtValorFinal.Text := 'R$ ' + FormatFloat('0.00', valorFinal);

    Perform(WM_NEXTDLGCTL, 0, 0);
end;

end.
