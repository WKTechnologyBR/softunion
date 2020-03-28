inherited frmCadastroClientes: TfrmCadastroClientes
  Caption = 'Cadastro de Clientes'
  ClientHeight = 481
  ClientWidth = 634
  ExplicitWidth = 640
  ExplicitHeight = 510
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 634
    Height = 481
    ExplicitWidth = 622
    ExplicitHeight = 486
    inherited tabPrincipal: TTabSheet
      ExplicitWidth = 614
      ExplicitHeight = 458
      inherited Panel1: TPanel
        Width = 626
        ExplicitWidth = 614
        inherited Shape1: TShape
          Width = 616
          ExplicitWidth = 577
        end
      end
      inherited DBGrid1: TDBGrid
        Width = 616
        Height = 354
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_CLIENTES'
            ReadOnly = True
            Title.Caption = 'C'#243'digo'
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_CLIENTES'
            ReadOnly = True
            Title.Caption = 'Nome dos clientes'
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
            FieldName = 'DT_NASCIMENTO'
            Title.Caption = 'Data Nasc.:'
            Width = 109
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TELEFONE'
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
          end
          item
            Expanded = False
            FieldName = 'DS_ENDERECOS'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CD_CIDADES'
            Visible = False
          end>
      end
      inherited Panel2: TPanel
        Top = 421
        Width = 626
        ExplicitTop = 426
        ExplicitWidth = 614
        DesignSize = (
          626
          32)
        inherited btnNovoRegistro: TButton
          Left = 525
          ExplicitLeft = 513
        end
      end
    end
    inherited tabEdicao: TTabSheet
      ExplicitWidth = 614
      ExplicitHeight = 458
      inherited Shape2: TShape
        Width = 616
        Height = 411
        ExplicitLeft = 5
        ExplicitTop = 7
        ExplicitWidth = 604
        ExplicitHeight = 416
      end
      inherited Label1: TLabel
        Top = 25
        ExplicitTop = 25
      end
      inherited Label2: TLabel
        Left = 193
        Top = 25
        Width = 76
        Caption = 'Nome do cliente'
        ExplicitLeft = 193
        ExplicitTop = 25
        ExplicitWidth = 76
      end
      inherited Label4: TLabel
        Top = 25
        ExplicitTop = 25
      end
      object Label8: TLabel [4]
        Left = 40
        Top = 67
        Width = 19
        Height = 13
        Caption = 'CPF'
      end
      object Label11: TLabel [5]
        Left = 255
        Top = 67
        Width = 14
        Height = 13
        Caption = 'RG'
      end
      object Label12: TLabel [6]
        Left = 186
        Top = 116
        Width = 33
        Height = 13
        Caption = 'Celular'
      end
      object Label13: TLabel [7]
        Left = 40
        Top = 116
        Width = 42
        Height = 13
        Caption = 'Telefone'
      end
      object Label14: TLabel [8]
        Left = 40
        Top = 162
        Width = 28
        Height = 13
        Caption = 'E-mail'
      end
      object Label15: TLabel [9]
        Left = 408
        Top = 116
        Width = 72
        Height = 13
        Caption = 'Data de Nasc.:'
      end
      object Label10: TLabel [10]
        Left = 40
        Top = 212
        Width = 38
        Height = 13
        Caption = 'Cidades'
      end
      object Label7: TLabel [11]
        Left = 303
        Top = 212
        Width = 38
        Height = 13
        Caption = 'Estados'
      end
      object Label5: TLabel [12]
        Left = 40
        Top = 262
        Width = 45
        Height = 13
        Caption = 'Endere'#231'o'
      end
      object Label6: TLabel [13]
        Left = 40
        Top = 310
        Width = 28
        Height = 13
        Caption = 'Bairro'
      end
      object Label9: TLabel [14]
        Left = 424
        Top = 310
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object Label16: TLabel [15]
        Left = 40
        Top = 358
        Width = 65
        Height = 13
        Caption = 'Complemento'
      end
      inherited edtCodigo: TEdit
        Top = 44
        Width = 147
        ExplicitTop = 44
        ExplicitWidth = 147
      end
      inherited edtDescricao: TEdit
        Left = 193
        Top = 44
        Width = 360
        ExplicitLeft = 193
        ExplicitTop = 44
        ExplicitWidth = 360
      end
      inherited Panel3: TPanel
        Top = 421
        Width = 626
        TabOrder = 14
        ExplicitTop = 421
        ExplicitWidth = 626
        inherited btnSalvar: TButton
          Left = 525
          ExplicitLeft = 525
        end
        inherited btnCancelar: TButton
          Left = 405
          ExplicitLeft = 405
        end
        inherited btnDeletar: TButton
          Visible = True
          OnClick = btnDeletarClick
        end
      end
      object edtCPF: TEdit
        Left = 40
        Top = 85
        Width = 209
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 2
      end
      object edtRG: TEdit
        Left = 255
        Top = 86
        Width = 298
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 3
      end
      object edtCelular: TEdit
        Left = 186
        Top = 135
        Width = 140
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 5
      end
      object edtTelefone: TEdit
        Left = 40
        Top = 135
        Width = 140
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 4
      end
      object edtEmail: TEdit
        Left = 40
        Top = 178
        Width = 513
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 7
      end
      object edtDataNascimento: TDateTimePicker
        Left = 408
        Top = 135
        Width = 145
        Height = 21
        Date = 43902.000000000000000000
        Time = 0.822922442130220600
        TabOrder = 6
      end
      object cbCidades: TComboBox
        Left = 40
        Top = 231
        Width = 257
        Height = 21
        Hint = 'CIDADES'
        Style = csDropDownList
        TabOrder = 8
      end
      object edtEndereco: TEdit
        Left = 40
        Top = 283
        Width = 513
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 10
      end
      object edtBairro: TEdit
        Left = 40
        Top = 329
        Width = 378
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 11
      end
      object edtNumero: TEdit
        Left = 424
        Top = 329
        Width = 129
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 12
      end
      object edtComplemento: TEdit
        Left = 40
        Top = 377
        Width = 513
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 13
      end
      object cbEstados: TComboBox
        Left = 303
        Top = 231
        Width = 250
        Height = 21
        Hint = 'ESTADOS'
        Style = csDropDownList
        TabOrder = 9
      end
    end
  end
  inherited FDMemTable1: TDWMemtable
    object FDMemTable1CD_CLIENTES: TIntegerField
      FieldName = 'CD_CLIENTES'
    end
    object FDMemTable1NM_CLIENTES: TStringField
      FieldName = 'NM_CLIENTES'
      Size = 60
    end
    object FDMemTable1CPF: TStringField
      FieldName = 'CPF'
    end
    object FDMemTable1RG: TStringField
      FieldName = 'RG'
    end
    object FDMemTable1DT_NASCIMENTO: TStringField
      FieldName = 'DT_NASCIMENTO'
      Size = 60
    end
    object FDMemTable1TELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object FDMemTable1CELULAR: TStringField
      FieldName = 'CELULAR'
    end
    object FDMemTable1EMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 60
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
      Size = 60
    end
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
