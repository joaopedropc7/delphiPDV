object frmCadastroGrupo: TfrmCadastroGrupo
  Left = 265
  Top = 129
  Width = 471
  Height = 340
  Caption = 'Cadastro grupos'
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
  object pnlBot: TPanel
    Left = 0
    Top = 285
    Width = 455
    Height = 16
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
  end
  object pnlLeft: TPanel
    Left = 0
    Top = 2
    Width = 16
    Height = 283
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
  end
  object pnlRight: TPanel
    Left = 439
    Top = 2
    Width = 16
    Height = 283
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 2
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 455
    Height = 2
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
  end
  object Panel1: TPanel
    Left = 16
    Top = 2
    Width = 423
    Height = 283
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    object lblTituloCadastro: TLabel
      Left = 24
      Top = 48
      Width = 161
      Height = 25
      Caption = 'Cadastro grupos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblIdGrup: TLabel
      Left = 32
      Top = 88
      Width = 20
      Height = 24
      Caption = 'ID'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 24
      Top = 144
      Width = 86
      Height = 16
      Caption = 'Nome grupo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText1: TDBText
      Left = 64
      Top = 88
      Width = 65
      Height = 25
      DataField = 'ID'
      DataSource = frmConsultaGrupos.DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBEdit1: TDBEdit
      Left = 24
      Top = 160
      Width = 177
      Height = 21
      DataField = 'NOME'
      DataSource = frmConsultaGrupos.DataSource1
      TabOrder = 0
    end
    object btnSalvar: TButton
      Left = 152
      Top = 232
      Width = 121
      Height = 41
      Caption = 'Salvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnSalvarClick
    end
  end
end
