object frmPagamento: TfrmPagamento
  Left = 257
  Top = 128
  Width = 430
  Height = 483
  Caption = 'Pagamento'
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
    Top = 428
    Width = 414
    Height = 16
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
  end
  object pnlLeft: TPanel
    Left = 0
    Top = 2
    Width = 16
    Height = 426
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
  end
  object pnlRight: TPanel
    Left = 398
    Top = 2
    Width = 16
    Height = 426
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 2
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 414
    Height = 2
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
  end
  object pnlAllClient: TPanel
    Left = 16
    Top = 2
    Width = 382
    Height = 426
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    object pnlTitulo: TPanel
      Left = 0
      Top = 0
      Width = 382
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
      Width = 382
      Height = 385
      Align = alClient
      TabOrder = 1
      object ComboBox1: TComboBox
        Left = 32
        Top = 24
        Width = 313
        Height = 28
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 20
        ParentFont = False
        TabOrder = 0
        Items.Strings = (
          'DINHEIRO'
          'PIX'
          'CART'#195'O DE CR'#201'DITO'
          'CART'#195'O DE D'#201'BITO'
          'CHEQUE')
      end
    end
  end
end