unit UnitCadastroProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, DBCtrls,
  StdCtrls, Mask, ExtCtrls;

type
  TfrmCadastroProduto = class(TForm)
    pnlBot: TPanel;
    pnlLeft: TPanel;
    pnlRight: TPanel;
    pnlTop: TPanel;
    pnlAllClient: TPanel;
    lblTitulo: TLabel;
    dbEdtNomePro: TDBEdit;
    lblNomePro: TLabel;
    lblValorCompra: TLabel;
    dbEdtValorCompra: TDBEdit;
    lblValorVenda: TLabel;
    dbEdtValorVenda: TDBEdit;
    dbCbPromocao: TDBCheckBox;
    lblValorPromocao: TLabel;
    dbEdtValorPromocao: TDBEdit;
    btnSalvar: TButton;
    dbEdtIdProd: TDBText;
    lblIdProd: TLabel;
    lblGrupo: TLabel;
    DataSource1: TDataSource;
    qryBuscaGrupos: TZQuery;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroProduto: TfrmCadastroProduto;

implementation

uses UnitPrincipal, UnitProdutos;

{$R *.dfm}

procedure TfrmCadastroProduto.btnSalvarClick(Sender: TObject);
	var textSql: string;
begin
	if frmConsultaProdutos.qryConsultaProdutos.State = dsInsert then
  begin

    frmConsultaProdutos.qryConsultaProdutos.FieldByName('QUANTIDADE').AsInteger := 0;
    frmConsultaProdutos.qryConsultaProdutos.FieldByName('CRIADO').AsDateTime := Date;
    frmConsultaProdutos.qryConsultaProdutos.FieldByName('ATUALIZADO').AsDateTime := Date;
    if dbCbPromocao.Checked then
    frmConsultaProdutos.qryConsultaProdutos.FieldByName('PROMOCAO').AsString := 'S'
    else
    frmConsultaProdutos.qryConsultaProdutos.FieldByName('PROMOCAO').AsString := 'N'
    ;
    frmConsultaProdutos.qryConsultaProdutos.Post;

    ShowMessage('Produto cadastrado com sucesso!');

  end;

  if frmConsultaProdutos.qryConsultaProdutos.State = dsEdit then
  begin

  	frmConsultaProdutos.qryConsultaProdutos.Post;

    ShowMessage('Produto atualizado com sucesso!');
  end;
end;

procedure TfrmCadastroProduto.FormShow(Sender: TObject);
begin
	qryBuscaGrupos.Refresh;
end;

end.
