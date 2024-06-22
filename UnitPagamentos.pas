unit UnitPagamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBCtrls, Mask;

type
  TfrmPagamento = class(TForm)
    pnlBottom: TPanel;
    pnlLeft: TPanel;
    pnlRight: TPanel;
    pnlTop: TPanel;
    pnlAllClient: TPanel;
    pnlTitulo: TPanel;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    qryFormasPG: TZQuery;
    DataSource1: TDataSource;
    lblFormasPGTO: TLabel;
    lblValor: TLabel;
    btnFinalizar: TButton;
    edtValorFinal: TEdit;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    dbEdtValorPagamento: TDBEdit;
    dbCBFormasPG: TDBComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AdjustGridColumnWidth;
    procedure verificaValorTotalPGDB;
    valorPagoDb, valorRestante, valorTotalVenda: Double;
  end;

var
  frmPagamento: TfrmPagamento;

implementation

uses UnitPrincipal, UnitVendas, UnitVendaPDV;

{$R *.dfm}

procedure TfrmPagamento.FormShow(Sender: TObject);
begin
  qryFormasPG.SQL.Text := 'SELECT * FROM FORMAS_PAGAMENTO WHERE VENDA_ID = :ID';
  qryFormasPG.ParamByName('ID').AsInteger := frmVenda.vendaAtual;
  qryFormasPG.Open;
end;

procedure TfrmPagamento.AdjustGridColumnWidth;
begin
  DBGrid1.Columns[0].Width := 150;
  DBGrid1.Columns[1].Width := 50;
end;

procedure TfrmPagamento.FormCreate(Sender: TObject);
begin
	qryFormasPG.Insert;

end;

procedure TfrmPagamento.verificaValorTotalPGDB;
var valorASomar: Double;
begin
  valorPagoDb := 0;
  qryFormasPG.SQL.Text := 'SELECT * FROM FORMAS_PAGAMENTO WHERE VENDA_ID = :ID';
  qryFormasPG.ParamByName('ID').AsInteger := frmVenda.vendaAtual;
  qryFormasPG.Open;
  qryFormasPG.First;
  while not qryFormasPG.Eof do
  begin
  	valorASomar := qryFormasPG.FieldByName('VALOR').AsFloat;
    valorPagoDb := valorPagoDb + valorASomar;
    qryFormasPG.Next;
  end;
  edtValorFinal.Text := FloatToStr(frmVendaPDV.valorTotalVenda)

end;

end.

