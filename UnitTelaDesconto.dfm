object frmDesconto: TfrmDesconto
  Left = 508
  Top = 184
  Width = 415
  Height = 408
  Caption = 'Venda - desconto'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 399
    Height = 2
    Align = alTop
    TabOrder = 0
  end
  object pnlRight: TPanel
    Left = 383
    Top = 2
    Width = 16
    Height = 351
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
  end
  object pnlLeft: TPanel
    Left = 0
    Top = 2
    Width = 16
    Height = 351
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 2
  end
  object pnlBot: TPanel
    Left = 0
    Top = 353
    Width = 399
    Height = 16
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
  end
  object pnlAllClient: TPanel
    Left = 16
    Top = 2
    Width = 367
    Height = 351
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    object pnlTitulo: TPanel
      Left = 0
      Top = 0
      Width = 367
      Height = 49
      Align = alTop
      BevelInner = bvLowered
      Caption = 'Desconto'
      Color = clHighlight
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -23
      Font.Name = 'Nirmala UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object pnlAllClientDesconto: TPanel
      Left = 0
      Top = 49
      Width = 367
      Height = 302
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 1
      object lblDescontoPr: TLabel
        Left = 64
        Top = 40
        Width = 84
        Height = 16
        Caption = 'Desconto %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 208
        Top = 40
        Width = 90
        Height = 16
        Caption = 'Desconto R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 64
        Top = 136
        Width = 80
        Height = 16
        Caption = 'Valor cheio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 208
        Top = 136
        Width = 71
        Height = 16
        Caption = 'Valor final'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtDescontoPr: TEdit
        Left = 64
        Top = 56
        Width = 89
        Height = 33
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnKeyPress = edtDescontoPrKeyPress
      end
      object edtDescontoVl: TEdit
        Left = 208
        Top = 56
        Width = 89
        Height = 33
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object pnlBotaoConfirmar: TPanel
        Left = 96
        Top = 240
        Width = 185
        Height = 41
        BevelInner = bvLowered
        BevelOuter = bvSpace
        BorderStyle = bsSingle
        Color = clGreen
        TabOrder = 2
        object SpeedButton1: TSpeedButton
          Left = 0
          Top = 0
          Width = 185
          Height = 41
          Caption = 'Confirmar'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -20
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object edtValorFinal: TEdit
        Left = 208
        Top = 152
        Width = 89
        Height = 33
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -20
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object edtValorCheio: TEdit
        Left = 64
        Top = 152
        Width = 89
        Height = 33
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -20
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
    end
  end
end
