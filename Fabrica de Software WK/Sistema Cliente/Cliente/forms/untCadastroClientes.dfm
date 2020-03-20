inherited frmCadastroClientes: TfrmCadastroClientes
  Caption = 'Cadastro de Clientes'
  ClientHeight = 407
  ClientWidth = 595
  ExplicitWidth = 601
  ExplicitHeight = 436
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 595
    Height = 407
    ActivePage = tabEdicao
    ExplicitWidth = 595
    ExplicitHeight = 407
    inherited tabPrincipal: TTabSheet
      ExplicitWidth = 587
      ExplicitHeight = 379
      inherited Panel1: TPanel
        Width = 587
        ExplicitWidth = 587
        inherited Shape1: TShape
          Width = 577
          ExplicitWidth = 577
        end
      end
      inherited DBGrid1: TDBGrid
        Width = 577
        Height = 280
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
            Title.Caption = 'Clientes'
            Width = 154
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CPF'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RG'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_ENDERECOS'
            Width = -1
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'DT_NASCIMENTO'
            Title.Caption = 'Data Nasc.:'
            Width = 109
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FONE'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CELULAR'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'EMAIL'
            Visible = False
          end>
      end
      inherited Panel2: TPanel
        Top = 347
        Width = 587
        ExplicitTop = 347
        ExplicitWidth = 587
        DesignSize = (
          587
          32)
        inherited btnNovoRegistro: TButton
          Left = 486
          ExplicitLeft = 486
        end
      end
    end
    inherited tabEdicao: TTabSheet
      ExplicitWidth = 587
      ExplicitHeight = 379
      inherited Shape2: TShape
        Width = 577
        Height = 337
        ExplicitWidth = 577
        ExplicitHeight = 337
      end
      inherited Label1: TLabel
        Top = 105
        ExplicitTop = 105
      end
      inherited Label2: TLabel
        Left = 193
        Top = 105
        Width = 76
        Caption = 'Nome do cliente'
        ExplicitLeft = 193
        ExplicitTop = 105
        ExplicitWidth = 76
      end
      inherited Label4: TLabel
        Top = 105
        ExplicitTop = 105
      end
      object Label5: TLabel [4]
        Left = 40
        Top = 196
        Width = 45
        Height = 13
        Caption = 'Endere'#231'o'
      end
      object Label8: TLabel [5]
        Left = 40
        Top = 147
        Width = 19
        Height = 13
        Caption = 'CPF'
      end
      object Label11: TLabel [6]
        Left = 255
        Top = 147
        Width = 14
        Height = 13
        Caption = 'RG'
      end
      object Label12: TLabel [7]
        Left = 186
        Top = 239
        Width = 33
        Height = 13
        Caption = 'Celular'
      end
      object Label13: TLabel [8]
        Left = 40
        Top = 239
        Width = 42
        Height = 13
        Caption = 'Telefone'
      end
      object Label14: TLabel [9]
        Left = 332
        Top = 239
        Width = 28
        Height = 13
        Caption = 'E-mail'
      end
      object Label15: TLabel [10]
        Left = 408
        Top = 196
        Width = 72
        Height = 13
        Caption = 'Data de Nasc.:'
      end
      inherited edtCodigo: TEdit
        Top = 124
        Width = 147
        ExplicitTop = 124
        ExplicitWidth = 147
      end
      inherited edtDescricao: TEdit
        Left = 193
        Top = 124
        Width = 352
        ExplicitLeft = 193
        ExplicitTop = 124
        ExplicitWidth = 352
      end
      inherited Panel3: TPanel
        Top = 347
        Width = 587
        ExplicitTop = 347
        ExplicitWidth = 587
        inherited btnSalvar: TButton
          Left = 486
          ExplicitLeft = 486
        end
        inherited btnCancelar: TButton
          Left = 366
          ExplicitLeft = 366
        end
        inherited btnDeletar: TButton
          Visible = True
          OnClick = btnDeletarClick
        end
      end
      object edtCPF: TEdit
        Left = 40
        Top = 165
        Width = 209
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 3
      end
      object edtRG: TEdit
        Left = 255
        Top = 165
        Width = 290
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 4
      end
      object edtCelular: TEdit
        Left = 186
        Top = 256
        Width = 140
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 5
      end
      object edtTelefone: TEdit
        Left = 40
        Top = 256
        Width = 140
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 6
      end
      object edtEmail: TEdit
        Left = 332
        Top = 256
        Width = 213
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 7
      end
      object cbEnderecos: TComboBox
        Left = 40
        Top = 213
        Width = 362
        Height = 21
        Hint = 'ENDERECOS'
        TabOrder = 9
        Text = 'cbEnderecos'
      end
      object edtDataNascimento: TDateTimePicker
        Left = 408
        Top = 213
        Width = 137
        Height = 21
        Date = 43902.000000000000000000
        Time = 0.822922442130220600
        TabOrder = 8
      end
    end
  end
  inherited FDMemTable1: TFDMemTable
    object FDMemTable1CPF: TStringField
      FieldName = 'CPF'
      Size = 15
    end
    object FDMemTable1RG: TStringField
      FieldName = 'RG'
      Size = 15
    end
    object FDMemTable1DS_ENDERECOS: TStringField
      FieldName = 'DS_ENDERECOS'
      Size = 60
    end
    object FDMemTable1FONE: TStringField
      FieldName = 'FONE'
      Size = 15
    end
    object FDMemTable1CELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 15
    end
    object FDMemTable1EMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 60
    end
  end
end
