inherited frmCadastroEstados: TfrmCadastroEstados
  Caption = 'Cadastro dos Estados'
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
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_CADASTRO'
            ReadOnly = True
            Title.Caption = 'Descri'#231#227'o'
            Width = 293
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SIGLA'
            Title.Caption = 'Sigla'
            Width = 51
            Visible = True
          end>
      end
    end
    inherited tabEdicao: TTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label5: TLabel [4]
        Left = 392
        Top = 140
        Width = 22
        Height = 13
        Caption = 'Sigla'
      end
      inherited edtDescricao: TEdit
        Width = 346
        ExplicitWidth = 346
      end
      inherited Panel3: TPanel
        TabOrder = 3
        inherited btnDeletar: TButton
          Visible = True
          OnClick = btnDeletarClick
        end
      end
      object edtSigla: TEdit
        Left = 392
        Top = 159
        Width = 57
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 2
      end
    end
  end
  inherited FDMemTable1: TFDMemTable
    object FDMemTable1SIGLA: TStringField
      FieldName = 'SIGLA'
      Size = 2
    end
  end
end
