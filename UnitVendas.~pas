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
    procedure edtNumeroVendaKeyPress(Sender: TObject; var Key: Char);
    
  private
    { Private declarations }
  public
    { Public declarations }
    vendaAtual, proximaVendaDB: Integer;
    vendaExiste: Boolean;
    procedure alteraIdVendaParaUltima;
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
  proximaVendaDB := vendaAtual;
  edtNumeroVenda.Text := IntToStr(vendaAtual);
  vendaExiste := True;
end;

procedure TfrmVenda.btnConfirmarVendaClick(Sender: TObject);
begin
  if (not vendaExiste) then
  begin
		ShowMessage('Coloque o número de uma venda existente!');
  	Exit;
  end;
	Application.CreateForm(TfrmVendaPDV, frmVendaPDV);

  try
    if vendaAtual = proximaVendaDB then
    begin
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
    end;
		frmVendaPDV.ShowModal;
  finally
    frmVendaPDV.Free;
	end;
end;

procedure TfrmVenda.edtNumeroVendaKeyPress(Sender: TObject; var Key: Char);
	var idVendaEdit: Integer;
begin
	if Key = #13 then
  begin
		idVendaEdit := StrToInt(edtNumeroVenda.Text);
    if idVendaEdit <> vendaAtual then
    begin

      qryVenda.SQL.Text := 'SELECT * FROM VENDAS WHERE ID = :ID';
      qryVenda.ParamByName('ID').AsInteger := idVendaEdit;
      qryVenda.Open;

      if qryVenda.IsEmpty then
      begin
        ShowMessage('Venda não encontrada');
        vendaExiste := False;
        Exit;
      end;
      vendaAtual := idVendaEdit;
      vendaExiste := True;
      btnConfirmarVenda.SetFocus;
    end;
    Key := #0;
  end;
end;

procedure TfrmVenda.alteraIdVendaParaUltima;
begin
  qryVenda.SQL.Text := 'SELECT MAX(ID) AS ULTIMOID FROM VENDAS;';
	qryVenda.Open;
	vendaAtual := qryVenda.Fields[0].AsInteger + 1;
  proximaVendaDB := vendaAtual;
  edtNumeroVenda.Text := IntToStr(vendaAtual);
  vendaExiste := True;
end;

end.
