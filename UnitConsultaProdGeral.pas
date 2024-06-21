unit UnitConsultaProdGeral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids,
  DBGrids, StdCtrls, ExtCtrls;

type
  TfrmConsultaProd = class(TForm)
    pnlTopo: TPanel;
    pnlRight: TPanel;
    pnlLeft: TPanel;
    pnlBot: TPanel;
    pnlAllClient: TPanel;
    Panel1: TPanel;
    edtConsultaProd: TEdit;
    pnlAllclientdb: TPanel;
    DBGrid1: TDBGrid;
    qryConsultaProdutos: TZQuery;
    DataSource1: TDataSource;
    procedure edtConsultaProdChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    idSelecionado: Integer;
  end;

var
  frmConsultaProd: TfrmConsultaProd;

implementation

uses UnitPrincipal;

{$R *.dfm}

procedure TfrmConsultaProd.edtConsultaProdChange(Sender: TObject);
var textoConsulta, consultaSql: String;
begin
  begin
  	textoConsulta :=	edtConsultaProd.Text;
    consultaSql := 'SELECT * FROM PRODUTOS WHERE UPPER(NOME) LIKE UPPER(:parametro)';
    qryConsultaProdutos.SQL.Text := consultaSql;
    qryConsultaProdutos.ParamByName('parametro').AsString := textoConsulta + '%';
    qryConsultaProdutos.Open;
  end;


end;

procedure TfrmConsultaProd.DBGrid1DblClick(Sender: TObject);
 var idSelecionadoStr: string;
begin
		idSelecionadoStr := qryConsultaProdutos.FieldValues['ID']; 

    idSelecionado := StrToInt(idSelecionadoStr);
    frmConsultaProd.Close;
end;

end.
