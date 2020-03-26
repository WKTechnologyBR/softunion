object frmPadrao: TfrmPadrao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Padr'#227'o'
  ClientHeight = 320
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 500
    Height = 320
    ActivePage = tabPrincipal
    Align = alClient
    TabOrder = 0
    object tabPrincipal: TTabSheet
      Caption = 'tabPrincipal'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 492
        Height = 57
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Shape1: TShape
          AlignWithMargins = True
          Left = 5
          Top = 5
          Width = 482
          Height = 47
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alClient
          Pen.Style = psDot
          ExplicitLeft = 0
          ExplicitTop = -2
          ExplicitWidth = 492
          ExplicitHeight = 57
        end
        object Label3: TLabel
          Left = 11
          Top = 33
          Width = 149
          Height = 13
          Caption = 'Duplo clique para editar o item.'
        end
        object lblQuantidadeArtigos: TLabel
          Left = 334
          Top = 33
          Width = 112
          Height = 13
          Caption = 'Quantidade de Itens: 0'
        end
      end
      object DBGrid1: TDBGrid
        AlignWithMargins = True
        Left = 5
        Top = 62
        Width = 482
        Height = 193
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        DataSource = DataSource1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_CADASTRO'
            ReadOnly = True
            Title.Caption = 'C'#243'digo'
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_CADASTRO'
            ReadOnly = True
            Title.Caption = 'Descri'#231#227'o'
            Width = 316
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 260
        Width = 492
        Height = 32
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        DesignSize = (
          492
          32)
        object btnNovoRegistro: TButton
          Left = 392
          Top = 5
          Width = 91
          Height = 25
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          Caption = 'Novo registro'
          TabOrder = 0
          OnClick = btnNovoRegistroClick
        end
      end
    end
    object tabEdicao: TTabSheet
      Caption = 'tabEdicao'
      ImageIndex = 1
      object Shape2: TShape
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 482
        Height = 250
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        Pen.Style = psDot
        ExplicitLeft = 10
        ExplicitTop = 13
      end
      object Label1: TLabel
        Left = 40
        Top = 85
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label2: TLabel
        Left = 40
        Top = 140
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label4: TLabel
        Left = 79
        Top = 85
        Width = 104
        Height = 13
        Caption = '(gerado pelo sistema)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edtCodigo: TEdit
        Left = 40
        Top = 104
        Width = 121
        Height = 21
        Color = clBtnFace
        Enabled = False
        TabOrder = 0
      end
      object edtDescricao: TEdit
        Left = 40
        Top = 159
        Width = 417
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 1
      end
      object Panel3: TPanel
        Left = 0
        Top = 260
        Width = 492
        Height = 32
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        DesignSize = (
          492
          32)
        object btnSalvar: TButton
          Left = 392
          Top = 5
          Width = 91
          Height = 25
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          Caption = 'Salvar'
          Default = True
          TabOrder = 2
          OnClick = btnSalvarClick
        end
        object btnCancelar: TButton
          Left = 272
          Top = 5
          Width = 114
          Height = 25
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          Caption = 'Cancelar'
          TabOrder = 1
          OnClick = btnCancelarClick
        end
        object btnDeletar: TButton
          Left = 40
          Top = 5
          Width = 75
          Height = 25
          Caption = 'Deletar'
          TabOrder = 0
          Visible = False
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 48
    Top = 240
  end
  object FDMemTable1: TDWMemtable
    FieldDefs = <>
    Left = 52
    Top = 176
  end
end
