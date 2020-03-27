inherited frmCadastroEnderecos: TfrmCadastroEnderecos
  Caption = 'Cadastro de endere'#231'os'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    ActivePage = tabEdicao
    inherited tabPrincipal: TTabSheet
      inherited DBGrid1: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_ENDERECOS'
            ReadOnly = True
            Title.Caption = 'C'#243'digo'
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_ENDERECOS'
            ReadOnly = True
            Title.Caption = 'Descri'#231#227'o'
            Width = 117
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BAIRRO'
            Title.Caption = 'Bairro'
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUMERO'
            Title.Caption = 'N'#250'mero'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMPLEMENTO'
            Title.Caption = 'Complemento'
            Width = 109
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_CIDADES'
            Visible = False
          end>
      end
    end
    inherited tabEdicao: TTabSheet
      inherited Shape2: TShape
        ExplicitLeft = 5
        ExplicitTop = 21
      end
      inherited Label1: TLabel
        Top = 45
        ExplicitTop = 45
      end
      inherited Label2: TLabel
        Top = 92
        Width = 45
        Caption = 'Endere'#231'o'
        ExplicitTop = 92
        ExplicitWidth = 45
      end
      inherited Label4: TLabel
        Top = 45
        ExplicitTop = 45
      end
      object Label5: TLabel [4]
        Left = 40
        Top = 140
        Width = 28
        Height = 13
        Caption = 'Bairro'
      end
      object Label6: TLabel [5]
        Left = 328
        Top = 140
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object Label7: TLabel [6]
        Left = 40
        Top = 188
        Width = 65
        Height = 13
        Caption = 'Complemento'
      end
      object Label8: TLabel [7]
        Left = 200
        Top = 45
        Width = 38
        Height = 13
        Caption = 'Cidades'
      end
      inherited edtCodigo: TEdit
        Top = 64
        ExplicitTop = 64
      end
      inherited edtDescricao: TEdit
        Top = 111
        ExplicitTop = 111
      end
      inherited Panel3: TPanel
        TabOrder = 5
      end
      object edtBairro: TEdit
        Left = 40
        Top = 159
        Width = 282
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 2
      end
      object edtNumero: TEdit
        Left = 328
        Top = 159
        Width = 129
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 3
      end
      object edtComplemento: TEdit
        Left = 40
        Top = 207
        Width = 417
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 4
      end
      object cbCidades: TComboBox
        Left = 200
        Top = 64
        Width = 257
        Height = 21
        Hint = 'CIDADES'
        Style = csDropDownList
        TabOrder = 6
      end
    end
  end
  inherited FDMemTable1: TDWMemtable
    object FDMemTable1CD_ENDERECOS: TIntegerField
      FieldName = 'CD_ENDERECOS'
    end
    object FDMemTable1DS_ENDERECOS: TStringField
      FieldName = 'DS_ENDERECOS'
      Size = 60
    end
    object FDMemTable1BAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 60
    end
    object FDMemTable1COMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 60
    end
    object FDMemTable1NUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 15
    end
    object FDMemTable1DS_CIDADES: TStringField
      FieldName = 'DS_CIDADES'
      Size = 60
    end
    object FDMemTable1CD_CIDADES: TIntegerField
      FieldName = 'CD_CIDADES'
    end
    object FDMemTable1CD_USUARIO: TIntegerField
      FieldName = 'CD_USUARIO'
    end
  end
end
