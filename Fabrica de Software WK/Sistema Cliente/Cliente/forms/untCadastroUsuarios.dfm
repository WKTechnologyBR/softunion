inherited frmCadastroUsuarios: TfrmCadastroUsuarios
  Caption = 'Cadastro de Usuarios'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited tabPrincipal: TTabSheet
      inherited DBGrid1: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_USUARIOS'
            ReadOnly = True
            Title.Caption = 'C'#243'digo'
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_USUARIOS'
            ReadOnly = True
            Title.Caption = 'Nome do Usu'#225'rio'
            Width = 140
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USUARIO'
            Title.Caption = 'Usu'#225'rio/Login'
            Width = 222
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
        Top = 132
        Width = 81
        Caption = 'Nome do Usu'#225'rio'
        ExplicitTop = 132
        ExplicitWidth = 81
      end
      object Label5: TLabel [4]
        Left = 40
        Top = 180
        Width = 36
        Height = 13
        Caption = 'Usu'#225'rio'
      end
      object Label6: TLabel [5]
        Left = 239
        Top = 180
        Width = 30
        Height = 13
        Caption = 'Senha'
      end
      inherited edtDescricao: TEdit
        Top = 151
        ExplicitTop = 151
      end
      inherited Panel3: TPanel
        TabOrder = 4
        inherited btnDeletar: TButton
          OnClick = btnDeletarClick
        end
      end
      object edtUsuario: TEdit
        Left = 40
        Top = 199
        Width = 193
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 2
      end
      object edtSenha: TEdit
        Left = 239
        Top = 199
        Width = 218
        Height = 21
        CharCase = ecUpperCase
        PasswordChar = '*'
        TabOrder = 3
      end
    end
  end
  inherited FDMemTable1: TDWMemtable
    object FDMemTable1CD_USUARIOS: TIntegerField
      FieldName = 'CD_USUARIOS'
    end
    object FDMemTable1NM_USUARIOS: TStringField
      FieldName = 'NM_USUARIOS'
      Size = 60
    end
    object FDMemTable1USUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 60
    end
    object FDMemTable1SENHA: TStringField
      FieldName = 'SENHA'
      Size = 60
    end
  end
end
