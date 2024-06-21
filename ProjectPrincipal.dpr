program ProjectPrincipal;

uses
  Forms,
  UnitPrincipal in 'UnitPrincipal.pas' {frmPrincipal},
  UnitProdutos in 'UnitProdutos.pas' {frmConsultaProdutos},
  UnitCadastroProduto in 'UnitCadastroProduto.pas' {frmCadastroProduto},
  UnitConsultaGrupos in 'UnitConsultaGrupos.pas' {frmConsultaGrupos},
  UnitCadastroGrupos in 'UnitCadastroGrupos.pas' {frmCadastroGrupo},
  UnitAjusteEstoque in 'UnitAjusteEstoque.pas' {frmAjusteEstoque},
  UnitVendas in 'UnitVendas.pas' {frmVenda},
  UnitVendaPDV in 'UnitVendaPDV.pas' {frmVendaPDV},
  UnitConsultaProdGeral in 'UnitConsultaProdGeral.pas' {frmConsultaProd},
  UnitPagamentos in 'UnitPagamentos.pas' {frmPagamento},
  UnitTelaDesconto in 'UnitTelaDesconto.pas' {frmDesconto};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
