object frmCadastroProduto: TfrmCadastroProduto
  Left = 267
  Top = 187
  BorderStyle = bsSingle
  Caption = 'Cadastro Produto'
  ClientHeight = 441
  ClientWidth = 912
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBot: TPanel
    Left = 0
    Top = 425
    Width = 912
    Height = 16
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
  end
  object pnlLeft: TPanel
    Left = 0
    Top = 2
    Width = 16
    Height = 423
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
  end
  object pnlRight: TPanel
    Left = 896
    Top = 2
    Width = 16
    Height = 423
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 2
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 912
    Height = 2
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
  end
  object pnlAllClient: TPanel
    Left = 16
    Top = 2
    Width = 880
    Height = 423
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    object lblTitulo: TLabel
      Left = 64
      Top = 8
      Width = 198
      Height = 25
      Caption = 'Cadastro de produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNomePro: TLabel
      Left = 64
      Top = 96
      Width = 99
      Height = 16
      Caption = 'Nome produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValorCompra: TLabel
      Left = 64
      Top = 144
      Width = 94
      Height = 16
      Caption = 'Valor compra'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValorVenda: TLabel
      Left = 176
      Top = 144
      Width = 85
      Height = 16
      Caption = 'Valor venda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValorPromocao: TLabel
      Left = 176
      Top = 192
      Width = 112
      Height = 16
      Caption = 'Valor promo'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbEdtIdProd: TDBText
      Left = 104
      Top = 48
      Width = 33
      Height = 25
      DataField = 'ID'
      DataSource = frmConsultaProdutos.DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblIdProd: TLabel
      Left = 64
      Top = 48
      Width = 25
      Height = 20
      Caption = 'ID:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblGrupo: TLabel
      Left = 64
      Top = 256
      Width = 43
      Height = 16
      Caption = 'Grupo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbEdtNomePro: TDBEdit
      Left = 64
      Top = 112
      Width = 225
      Height = 21
      Hint = 'Nome produto'
      DataField = 'NOME'
      DataSource = frmConsultaProdutos.DataSource1
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
    end
    object dbEdtValorCompra: TDBEdit
      Left = 64
      Top = 160
      Width = 97
      Height = 21
      Hint = 'Valor Compra'
      DataField = 'VALORCOMPRA'
      DataSource = frmConsultaProdutos.DataSource1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object dbEdtValorVenda: TDBEdit
      Left = 176
      Top = 160
      Width = 113
      Height = 21
      Hint = 'Nome produto'
      DataField = 'VALORVENDA'
      DataSource = frmConsultaProdutos.DataSource1
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
    end
    object dbCbPromocao: TDBCheckBox
      Left = 64
      Top = 208
      Width = 97
      Height = 17
      Caption = 'Promo'#231#227'o'
      DataField = 'PROMOCAO'
      DataSource = frmConsultaProdutos.DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object dbEdtValorPromocao: TDBEdit
      Left = 176
      Top = 208
      Width = 113
      Height = 21
      Hint = 'Valor Promo'#231#227'o'
      DataField = 'VALORPROMOCAO'
      DataSource = frmConsultaProdutos.DataSource1
      ParentShowHint = False
      ShowHint = False
      TabOrder = 4
    end
    object btnSalvar: TButton
      Left = 64
      Top = 320
      Width = 217
      Height = 57
      Caption = 'Salvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = btnSalvarClick
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 112
      Top = 256
      Width = 145
      Height = 21
      DataField = 'GRUPO_ID'
      DataSource = frmConsultaProdutos.DataSource1
      KeyField = 'ID'
      ListField = 'NOME'
      ListSource = DataSource1
      TabOrder = 6
    end
  end
  object DataSource1: TDataSource
    DataSet = qryBuscaGrupos
    Left = 656
    Top = 130
  end
  object qryBuscaGrupos: TZQuery
    Connection = frmPrincipal.conexaoBD
    Active = True
    SQL.Strings = (
      'SELECT * FROM GRUPOS')
    Params = <>
    Left = 656
    Top = 186
  end
end
