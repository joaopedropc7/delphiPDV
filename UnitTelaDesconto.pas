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
  private
    { Private declarations }
  public
    { Public declarations }
    valorDesconto, descontoPr, valorFinal, valorCheio: Double;
  end;

var
  frmDesconto: TfrmDesconto;

implementation

uses UnitVendaPDV;

{$R *.dfm}


procedure TfrmDesconto.edtDescontoPrKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (Key in ['0'..'9', #8, #13, #9, ',']) then
    Key := #0;
   	

  if (Key = #13) OR (Key = #9) then
  begin
    Key := #0;
   	ShowMessage('caiu no 2');
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
    edtDescontoVl.Text := 'R$ ' + FormatFloat('0.00', valorDesconto);
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
end;

end.
