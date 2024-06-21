unit UnitCadastroGrupos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, DB;

type
  TfrmCadastroGrupo = class(TForm)
    pnlBot: TPanel;
    pnlLeft: TPanel;
    pnlRight: TPanel;
    pnlTop: TPanel;
    Panel1: TPanel;
    lblTituloCadastro: TLabel;
    lblIdGrup: TLabel;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    btnSalvar: TButton;
    DBText1: TDBText;
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroGrupo: TfrmCadastroGrupo;

implementation

uses UnitConsultaGrupos;

{$R *.dfm}

procedure TfrmCadastroGrupo.btnSalvarClick(Sender: TObject);
begin
	if frmConsultaGrupos.qryGrupos.State = dsInsert then
  begin


    frmConsultaGrupos.qryGrupos.Post;

    ShowMessage('Grupo cadastrado com sucesso!');

  end;

  if frmConsultaGrupos.qryGrupos.State = dsEdit then
  begin

  	frmConsultaGrupos.qryGrupos.Post;

    ShowMessage('Grupo atualizado com sucesso!');
  end;
end;

end.
