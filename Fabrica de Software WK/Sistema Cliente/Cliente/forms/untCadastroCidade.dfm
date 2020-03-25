inherited frmCadastroCidade: TfrmCadastroCidade
  Caption = 'Cadastro de Cidades'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited tabPrincipal: TTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      inherited DBGrid1: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_CADASTRO'
            ReadOnly = True
            Title.Caption = 'C'#243'digo'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_CADASTRO'
            ReadOnly = True
            Title.Caption = 'Cidade'
            Width = 253
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_ESTADOS'
            Title.Caption = 'Estado'
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
  inherited FDMemTable1: TFDMemTable
    object FDMemTable1ESTADO: TStringField
      FieldName = 'DS_ESTADOS'
      Size = 60
    end
  end
end
