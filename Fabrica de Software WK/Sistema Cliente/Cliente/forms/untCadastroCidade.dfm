inherited frmCadastroCidade: TfrmCadastroCidade
  Caption = 'Cadastro de Cidades'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    ActivePage = tabPrincipal
    inherited tabPrincipal: TTabSheet
      inherited DBGrid1: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_CIDADES'
            ReadOnly = True
            Title.Caption = 'C'#243'digo'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_CIDADES'
            ReadOnly = True
            Title.Caption = 'Cidade'
            Width = 183
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_ESTADOS'
            Title.Caption = 'Estado'
            Width = 193
            Visible = True
          end>
      end
    end
    inherited tabEdicao: TTabSheet
      inherited Shape2: TShape
        ExplicitLeft = 5
        ExplicitTop = 7
      end
      inherited Label2: TLabel
        Top = 134
        ExplicitTop = 134
      end
      object Label6: TLabel [4]
        Left = 40
        Top = 183
        Width = 38
        Height = 13
        Caption = 'Estados'
      end
      inherited edtDescricao: TEdit
        Top = 153
        ExplicitTop = 153
      end
      inherited Panel3: TPanel
        TabOrder = 3
        inherited btnDeletar: TButton
          Visible = True
          OnClick = btnDeletarClick
        end
      end
      object cbEstados: TComboBox
        Left = 40
        Top = 202
        Width = 417
        Height = 21
        Hint = 'ESTADOS'
        Style = csDropDownList
        TabOrder = 2
      end
    end
  end
  inherited FDMemTable1: TDWMemtable
    object FDMemTable1CD_CIDADES: TIntegerField
      FieldName = 'CD_CIDADES'
    end
    object FDMemTable1DS_CIDADES: TStringField
      FieldName = 'DS_CIDADES'
      Size = 60
    end
    object FDMemTable1DS_ESTADOS: TStringField
      FieldName = 'DS_ESTADOS'
      Size = 60
    end
  end
end
