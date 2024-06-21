object frmConsultaProd: TfrmConsultaProd
  Left = 267
  Top = 129
  Width = 928
  Height = 480
  Caption = 'Consulta produtos'
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
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 912
    Height = 2
    Align = alTop
    Color = clInactiveCaption
    TabOrder = 0
  end
  object pnlRight: TPanel
    Left = 896
    Top = 2
    Width = 16
    Height = 423
    Align = alRight
    BevelOuter = bvNone
    Color = clInactiveCaption
    TabOrder = 1
  end
  object pnlLeft: TPanel
    Left = 0
    Top = 2
    Width = 16
    Height = 423
    Align = alLeft
    BevelOuter = bvNone
    Color = clInactiveCaption
    TabOrder = 2
  end
  object pnlBot: TPanel
    Left = 0
    Top = 425
    Width = 912
    Height = 16
    Align = alBottom
    BevelOuter = bvNone
    Color = clInactiveCaption
    TabOrder = 3
  end
  object pnlAllClient: TPanel
    Left = 16
    Top = 2
    Width = 880
    Height = 423
    Align = alClient
    BevelOuter = bvNone
    Color = clInactiveCaption
    TabOrder = 4
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 880
      Height = 41
      Align = alTop
      Color = clInactiveCaption
      TabOrder = 0
      object edtConsultaProd: TEdit
        Left = -1
        Top = 5
        Width = 881
        Height = 33
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = edtConsultaProdChange
      end
    end
    object pnlAllclientdb: TPanel
      Left = 0
      Top = 41
      Width = 880
      Height = 382
      Align = alClient
      BevelInner = bvLowered
      BevelOuter = bvSpace
      Color = clInactiveCaption
      TabOrder = 1
      object DBGrid1: TDBGrid
        Left = 2
        Top = 2
        Width = 876
        Height = 378
        Align = alClient
        DataSource = DataSource1
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Width = 615
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANTIDADE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORVENDA'
            Width = 102
            Visible = True
          end>
      end
    end
  end
  object qryConsultaProdutos: TZQuery
    Connection = frmPrincipal.conexaoBD
    SQL.Strings = (
      'SELECT * FROM PRODUTOS')
    Params = <>
    Left = 744
    Top = 259
  end
  object DataSource1: TDataSource
    DataSet = qryConsultaProdutos
    Left = 744
    Top = 299
  end
end
