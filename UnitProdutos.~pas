unit UnitProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids,
  DBGrids, Buttons, ExtCtrls;

type
  TfrmConsultaProdutos = class(TForm)
    pnlBottom: TPanel;
    pnlLeft: TPanel;
    pnlRight: TPanel;
    pnlTop: TPanel;
    pnlAllClient: TPanel;
    pnlBotoes: TPanel;
    btnCadastrar: TSpeedButton;
    btnEditar: TSpeedButton;
    qryConsultaProdutos: TZQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaProdutos: TfrmConsultaProdutos;

implementation

uses UnitPrincipal, UnitCadastroProduto;

{$R *.dfm}

procedure TfrmConsultaProdutos.btnCadastrarClick(Sender: TObject);
begin
	Application.CreateForm(TfrmCadastroProduto, frmCadastroProduto);
  try
    qryConsultaProdutos.Insert;
    frmCadastroProduto.ShowModal;
  finally
  	qryConsultaProdutos.Close;
    qryConsultaProdutos.Open;
    frmCadastroProduto.Free;
  end;
end;

procedure TfrmConsultaProdutos.btnEditarClick(Sender: TObject);
begin
   Application.CreateForm(TfrmCadastroProduto, frmCadastroProduto);
  try
	  qryConsultaProdutos.Edit;
    frmCadastroProduto.ShowModal;
  finally
  	qryConsultaProdutos.Close;
    qryConsultaProdutos.Open;
    frmCadastroProduto.Free;
  end;
end;

end.
