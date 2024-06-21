unit UnitConsultaGrupos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, Buttons, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TfrmConsultaGrupos = class(TForm)
    pnlBot: TPanel;
    pnlLeft: TPanel;
    pnlRight: TPanel;
    pnlTop: TPanel;
    pnlAllClient: TPanel;
    pnlBotoes: TPanel;
    btnCadastrar: TSpeedButton;
    btnEditar: TSpeedButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    qryGrupos: TZQuery;
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaGrupos: TfrmConsultaGrupos;

implementation

uses UnitPrincipal, UnitCadastroProduto, UnitCadastroGrupos;

{$R *.dfm}

procedure TfrmConsultaGrupos.btnCadastrarClick(Sender: TObject);
begin
		Application.CreateForm(TfrmCadastroGrupo, frmCadastroGrupo);
  try
    qryGrupos.Insert;
    frmCadastroGrupo.ShowModal;
  finally
  	qryGrupos.Close;
    qryGrupos.Open;
    frmCadastroGrupo.Free;
  end;
end;

procedure TfrmConsultaGrupos.btnEditarClick(Sender: TObject);
begin
   Application.CreateForm(TfrmCadastroGrupo, frmCadastroGrupo);
  try
    qryGrupos.Edit;
    frmCadastroGrupo.ShowModal;
  finally
  	qryGrupos.Close;
    qryGrupos.Open;
    frmCadastroGrupo.Free;
  end;
end;

end.
