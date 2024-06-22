object frmPagamento: TfrmPagamento
  Left = 244
  Top = 135
  Width = 448
  Height = 551
  Caption = 'Pagamento'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBottom: TPanel
    Left = 0
    Top = 496
    Width = 432
    Height = 16
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
  end
  object pnlLeft: TPanel
    Left = 0
    Top = 2
    Width = 16
    Height = 494
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
  end
  object pnlRight: TPanel
    Left = 416
    Top = 2
    Width = 16
    Height = 494
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 2
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 432
    Height = 2
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
  end
  object pnlAllClient: TPanel
    Left = 16
    Top = 2
    Width = 400
    Height = 494
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    object pnlTitulo: TPanel
      Left = 0
      Top = 0
      Width = 400
      Height = 41
      Align = alTop
      Caption = 'PAGAMENTO'
      Color = clHotLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object Panel1: TPanel
      Left = 0
      Top = 41
      Width = 400
      Height = 453
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object lblFormasPGTO: TLabel
        Left = 32
        Top = 16
        Width = 183
        Height = 18
        Caption = 'Formas de pagamento'
      end
      object lblValor: TLabel
        Left = 32
        Top = 72
        Width = 41
        Height = 18
        Caption = 'Valor'
      end
      object Label1: TLabel
        Left = 64
        Top = 320
        Width = 40
        Height = 18
        Caption = 'Total'
      end
      object Label2: TLabel
        Left = 200
        Top = 320
        Width = 40
        Height = 18
        Caption = 'Pago'
      end
      object DBGrid1: TDBGrid
        Left = 32
        Top = 136
        Width = 320
        Height = 129
        DataSource = DataSource1
        ParentShowHint = False
        ReadOnly = True
        ShowHint = False
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'Verdana'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'FORMA_PAGAMENTO'
            Title.Caption = 'Forma Pgto'
            Width = 172
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Title.Caption = 'Valor'
            Width = 128
            Visible = True
          end>
      end
      object btnFinalizar: TButton
        Left = 80
        Top = 392
        Width = 217
        Height = 41
        Caption = 'Finalizar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object edtValorFinal: TEdit
        Left = 64
        Top = 344
        Width = 97
        Height = 26
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        Text = 'R$ 0,00'
      end
      object Edit1: TEdit
        Left = 200
        Top = 344
        Width = 97
        Height = 26
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        Text = 'R$ 0,00'
      end
      object dbEdtValorPagamento: TDBEdit
        Left = 32
        Top = 96
        Width = 121
        Height = 26
        DataField = 'VALOR'
        DataSource = DataSource1
        TabOrder = 4
      end
      object dbCBFormasPG: TDBComboBox
        Left = 32
        Top = 40
        Width = 313
        Height = 26
        DataField = 'FORMA_PAGAMENTO'
        DataSource = DataSource1
        ItemHeight = 18
        Items.Strings = (
          'PIX'
          'CHEQUE'
          'DINHEIRO'
          'CART'#195'O DE CR'#201'DITO'
          'CART'#195'O DE D'#201'BITO')
        TabOrder = 5
      end
    end
  end
  object qryFormasPG: TZQuery
    Connection = frmPrincipal.conexaoBD
    SQL.Strings = (
      'SELECT * FROM FORMAS_PAGAMENTO WHERE ID = 1')
    Params = <>
    Left = 40
    Top = 3
  end
  object DataSource1: TDataSource
    DataSet = qryFormasPG
    Left = 88
    Top = 65531
  end
end
