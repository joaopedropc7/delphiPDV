unit UnitPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ZAbstractConnection, ZConnection, Buttons, DB, Menus;

type
  TfrmPrincipal = class(TForm)
    pnlTopo: TPanel;
    pnlLeft: TPanel;
    pnlRight: TPanel;
    pnlBot: TPanel;
    pnlAllClient: TPanel;
    pnlBotoes: TPanel;
    SpeedButton1: TSpeedButton;
    conexaoBD: TZConnection;
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Produtos1: TMenuItem;
    Grupos1: TMenuItem;
    Estoque1: TMenuItem;
    Ajustedeestoque1: TMenuItem;
    spdBtnVendas: TSpeedButton;
    relatorios: TMenuItem;
    Ajustesdeestoque1: TMenuItem;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Grupos1Click(Sender: TObject);
    procedure Ajustedeestoque1Click(Sender: TObject);
    procedure spdBtnVendasClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
   
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses UnitProdutos, UnitCadastroProduto, UnitConsultaGrupos,
  UnitAjusteEstoque, UnitVendas, UnitConsultaProdGeral;

{$R *.dfm}

procedure TfrmPrincipal.SpeedButton1Click(Sender: TObject);

begin
  Application.CreateForm(TfrmConsultaProdutos, frmConsultaProdutos);
  try
    frmConsultaProdutos.ShowModal;
  finally
    frmConsultaProdutos.Free;
  end;
end;

procedure TfrmPrincipal.Produtos1Click(Sender: TObject);
begin
	Application.CreateForm(TfrmConsultaProdutos, frmConsultaProdutos);
  try
		frmConsultaProdutos.ShowModal;
  finally
    frmConsultaProdutos.Free;
  end;
end;
procedure TfrmPrincipal.Grupos1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmConsultaGrupos, frmConsultaGrupos);
  try
		frmConsultaGrupos.ShowModal;
  finally
    frmConsultaGrupos.Free;
  end;
end;

procedure TfrmPrincipal.Ajustedeestoque1Click(Sender: TObject);
begin
	 Application.CreateForm(TfrmAjusteEstoque, frmAjusteEstoque);
  try
		frmAjusteEstoque.ShowModal;
  finally
    frmAjusteEstoque.Free;
  end;
end;

procedure TfrmPrincipal.spdBtnVendasClick(Sender: TObject);
begin
	Application.CreateForm(TfrmVenda, frmVenda);
  try
		frmVenda.ShowModal;
  finally
    frmVenda.Free;
  end;
end;



procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	case Key of
    VK_F7:
    begin
      Application.CreateForm(TfrmConsultaProd, frmConsultaProdutos);
      try
        frmConsultaProdutos.ShowModal;
      finally
        frmConsultaProdutos.Free;
      end;
    end;  
	end;
end;

end.
