unit UnitVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  TfrmVenda = class(TForm)
    pnlTopo: TPanel;
    pnlRight: TPanel;
    pnlLeft: TPanel;
    pnlBot: TPanel;
    pnlAllClient: TPanel;
    pnlTitulo: TPanel;
    lblTitulo: TLabel;
    btnConfirmarVenda: TButton;
    edtNumeroVenda: TEdit;
    lblNumVenda: TLabel;
    qryVenda: TZQuery;
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarVendaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vendaAtual: Integer;
  end;

var
  frmVenda: TfrmVenda;

implementation

uses UnitPrincipal, UnitVendaPDV;

{$R *.dfm}

procedure TfrmVenda.FormShow(Sender: TObject);

begin
	qryVenda.Open;
	vendaAtual := qryVenda.Fields[0].AsInteger + 1;
  edtNumeroVenda.Text := IntToStr(vendaAtual);
end;

procedure TfrmVenda.btnConfirmarVendaClick(Sender: TObject);
begin
	Application.CreateForm(TfrmVendaPDV, frmVendaPDV);

  try
    qryVenda.SQL.Text := 'INSERT INTO VENDAS (ID ,VALOR, DATA, DATAATT, FORMAPG, DESPR, DESCVL) VALUES (:ID,:VALOR, :DATA, :DATAATT, :FORMAPG, :DESPR, :DESCVL)';
    qryVenda.ParamByName('ID').AsInteger := vendaAtual;
    qryVenda.ParamByName('VALOR').AsFloat := 0.0;
		qryVenda.ParamByName('DATA').AsDate := Date;
    qryVenda.ParamByName('DATAATT').AsDate := Date;
    qryVenda.ParamByName('DESPR').AsFloat := 0.0;
    qryVenda.ParamByName('DESCVL').AsFloat := 0.0;
    qryVenda.ExecSQL;
    qryVenda.SQL.Text := 'SELECT * FROM VENDAS WHERE ID = :ID';
    qryVenda.ParamByName('ID').AsInteger := vendaAtual;
		frmVendaPDV.ShowModal;
  finally
    frmVendaPDV.Free;
	end;
end;

end.
