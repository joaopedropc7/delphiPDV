object frmVenda: TfrmVenda
  Left = 473
  Top = 185
  Width = 382
  Height = 353
  Caption = 'Venda'
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
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 366
    Height = 2
    Align = alTop
    TabOrder = 0
  end
  object pnlRight: TPanel
    Left = 350
    Top = 2
    Width = 16
    Height = 296
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
  end
  object pnlLeft: TPanel
    Left = 0
    Top = 2
    Width = 16
    Height = 296
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 2
  end
  object pnlBot: TPanel
    Left = 0
    Top = 298
    Width = 366
    Height = 16
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
  end
  object pnlAllClient: TPanel
    Left = 16
    Top = 2
    Width = 334
    Height = 296
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    object lblNumVenda: TLabel
      Left = 104
      Top = 64
      Width = 77
      Height = 20
      Caption = 'N'#186' Venda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object pnlTitulo: TPanel
      Left = 0
      Top = 0
      Width = 334
      Height = 41
      Align = alTop
      BevelInner = bvSpace
      BevelOuter = bvLowered
      Color = clRed
      TabOrder = 0
      object lblTitulo: TLabel
        Left = 128
        Top = 8
        Width = 90
        Height = 25
        Align = alCustom
        Alignment = taCenter
        Caption = 'VENDAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -20
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object btnConfirmarVenda: TButton
      Left = 104
      Top = 240
      Width = 137
      Height = 25
      Caption = 'Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnConfirmarVendaClick
    end
    object edtNumeroVenda: TEdit
      Left = 104
      Top = 88
      Width = 137
      Height = 37
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -23
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnKeyPress = edtNumeroVendaKeyPress
    end
  end
  object qryVenda: TZQuery
    Connection = frmPrincipal.conexaoBD
    Active = True
    SQL.Strings = (
      'SELECT MAX(ID) AS ULTIMOID FROM VENDAS')
    Params = <>
    Left = 328
    Top = 234
  end
end
