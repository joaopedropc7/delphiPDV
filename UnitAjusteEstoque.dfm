object frmAjusteEstoque: TfrmAjusteEstoque
  Left = 537
  Top = 185
  Width = 422
  Height = 381
  Caption = 'Ajuste de estoque'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBottom: TPanel
    Left = 0
    Top = 326
    Width = 406
    Height = 16
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
  end
  object pnlLeft: TPanel
    Left = 0
    Top = 2
    Width = 16
    Height = 324
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
  end
  object pnlRight: TPanel
    Left = 390
    Top = 2
    Width = 16
    Height = 324
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 2
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 406
    Height = 2
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
  end
  object pnlAllClient: TPanel
    Left = 16
    Top = 2
    Width = 374
    Height = 324
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    object pnlTitulo: TPanel
      Left = 0
      Top = 0
      Width = 374
      Height = 41
      Align = alTop
      BevelOuter = bvLowered
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object lblTitulo: TLabel
        Left = 105
        Top = 9
        Width = 170
        Height = 24
        Align = alCustom
        Alignment = taCenter
        BiDiMode = bdLeftToRight
        Caption = 'Ajuste de estoque'
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentColor = False
        ParentFont = False
      end
    end
    object pnlClientAjuste: TPanel
      Left = 0
      Top = 41
      Width = 374
      Height = 283
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 1
      object lblCodPro: TLabel
        Left = 16
        Top = 32
        Width = 87
        Height = 13
        Caption = 'C'#243'digo produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNmPro: TLabel
        Left = 136
        Top = 32
        Width = 80
        Height = 13
        Caption = 'Nome produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 16
        Top = 96
        Width = 65
        Height = 13
        Caption = 'Saldo atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNovoSaldo: TLabel
        Left = 136
        Top = 96
        Width = 65
        Height = 13
        Caption = 'Novo saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblHistorico: TLabel
        Left = 16
        Top = 144
        Width = 51
        Height = 13
        Caption = 'Historico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtCodPro: TEdit
        Left = 16
        Top = 48
        Width = 73
        Height = 21
        TabOrder = 0
        OnExit = edtCodProExit
        OnKeyPress = edtCodProKeyPress
      end
      object edtHistorico: TEdit
        Left = 16
        Top = 160
        Width = 321
        Height = 21
        TabOrder = 1
      end
      object edtSaldoAtual: TEdit
        Left = 16
        Top = 112
        Width = 73
        Height = 21
        Enabled = False
        TabOrder = 2
      end
      object edtNovoSaldo: TEdit
        Left = 136
        Top = 112
        Width = 81
        Height = 21
        TabOrder = 3
      end
      object Button1: TButton
        Left = 120
        Top = 208
        Width = 129
        Height = 33
        Caption = 'Salvar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = Button1Click
      end
      object edtNomePro: TEdit
        Left = 136
        Top = 48
        Width = 209
        Height = 21
        TabOrder = 5
        OnKeyDown = edtNomeProKeyDown
      end
    end
  end
  object qryAjusteEstoque: TZQuery
    Connection = frmPrincipal.conexaoBD
    SQL.Strings = (
      'SELECT ID, NOME FROM PRODUTOS WHERE ID = 1')
    Params = <>
    Left = 336
    Top = 267
  end
end
