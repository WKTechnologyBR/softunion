inherited frmCadastroPessoas: TfrmCadastroPessoas
  Caption = 'Cadastro de Pessoas'
  ClientHeight = 481
  ClientWidth = 634
  ExplicitWidth = 640
  ExplicitHeight = 510
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 634
    Height = 481
    ActivePage = tabEdicao
    ExplicitWidth = 637
    ExplicitHeight = 482
    inherited tabPrincipal: TTabSheet
      ExplicitWidth = 629
      ExplicitHeight = 454
      inherited Panel1: TPanel
        Width = 626
        ExplicitWidth = 629
        inherited Shape1: TShape
          Width = 616
          ExplicitWidth = 574
        end
      end
      inherited DBGrid1: TDBGrid
        Width = 616
        Height = 354
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_PESSOAS'
            ReadOnly = True
            Title.Caption = 'C'#243'digo'
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_PESSOAS'
            ReadOnly = True
            Title.Caption = 'Descri'#231#227'o'
            Width = 316
            Visible = True
          end>
      end
      inherited Panel2: TPanel
        Top = 421
        Width = 626
        ExplicitTop = 422
        ExplicitWidth = 629
        inherited btnNovoRegistro: TButton
          Left = 530
          Top = 3
          ExplicitLeft = 530
          ExplicitTop = 3
        end
      end
    end
    inherited tabEdicao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 629
      ExplicitHeight = 454
      inherited Shape2: TShape
        Width = 616
        Height = 411
        ExplicitLeft = 5
        ExplicitTop = 7
        ExplicitWidth = 686
        ExplicitHeight = 412
      end
      inherited Label1: TLabel
        Top = 61
        ExplicitTop = 61
      end
      inherited Label2: TLabel
        Left = 188
        Top = 61
        Width = 34
        Caption = 'Pessoa'
        ExplicitLeft = 188
        ExplicitTop = 61
        ExplicitWidth = 34
      end
      inherited Label4: TLabel
        Top = 61
        ExplicitTop = 61
      end
      object Label15: TLabel [4]
        Left = 447
        Top = 63
        Width = 72
        Height = 13
        Caption = 'Data de Nasc.:'
      end
      object Label8: TLabel [5]
        Left = 40
        Top = 112
        Width = 72
        Height = 13
        Caption = 'Tipo de Pessoa'
      end
      object Label5: TLabel [6]
        Left = 40
        Top = 158
        Width = 48
        Height = 13
        Caption = 'CPF/CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblNomeFantasia: TLabel [7]
        Left = 188
        Top = 112
        Width = 71
        Height = 13
        Caption = 'Nome Fantasia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object lblRazaoSocial: TLabel [8]
        Left = 188
        Top = 158
        Width = 60
        Height = 13
        Caption = 'Raz'#227'o Social'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Label10: TLabel [9]
        Left = 40
        Top = 204
        Width = 38
        Height = 13
        Caption = 'Cidades'
      end
      object Label11: TLabel [10]
        Left = 40
        Top = 254
        Width = 45
        Height = 13
        Caption = 'Endere'#231'o'
      end
      object Label12: TLabel [11]
        Left = 40
        Top = 302
        Width = 28
        Height = 13
        Caption = 'Bairro'
      end
      object Label13: TLabel [12]
        Left = 424
        Top = 302
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object Label14: TLabel [13]
        Left = 40
        Top = 350
        Width = 65
        Height = 13
        Caption = 'Complemento'
      end
      object Label7: TLabel [14]
        Left = 303
        Top = 204
        Width = 38
        Height = 13
        Caption = 'Estados'
      end
      inherited edtCodigo: TEdit
        Top = 80
        ExplicitTop = 80
      end
      inherited edtDescricao: TEdit
        Left = 189
        Top = 80
        Width = 252
        ExplicitLeft = 189
        ExplicitTop = 80
        ExplicitWidth = 252
      end
      inherited Panel3: TPanel
        Top = 421
        Width = 626
        TabOrder = 13
        ExplicitTop = 422
        ExplicitWidth = 629
        inherited btnSalvar: TButton
          Left = 526
          Top = 5
          ExplicitLeft = 526
          ExplicitTop = 5
        end
        inherited btnCancelar: TButton
          Left = 406
          ExplicitLeft = 409
        end
      end
      object edtDataNascimento: TDateTimePicker
        Left = 447
        Top = 80
        Width = 106
        Height = 21
        Date = 43902.000000000000000000
        Time = 0.822922442130220600
        TabOrder = 2
      end
      object cbTipoPessoa: TComboBox
        Left = 40
        Top = 129
        Width = 143
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 3
        Text = 'Pessoa F'#237'sica'
        OnCloseUp = cbTipoPessoaCloseUp
        Items.Strings = (
          'Pessoa F'#237'sica'
          'Pessoa Jur'#237'dica')
      end
      object edtCPFCNPJ: TEdit
        Left = 39
        Top = 177
        Width = 143
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 5
      end
      object edtRazaoSocial: TEdit
        Left = 188
        Top = 177
        Width = 214
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 6
        Visible = False
      end
      object edtNomeFantasia: TEdit
        Left = 189
        Top = 129
        Width = 364
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 4
        Visible = False
      end
      object Panel4: TPanel
        Left = 151
        Top = 9
        Width = 262
        Height = 46
        BevelOuter = bvNone
        TabOrder = 14
        object Label6: TLabel
          Left = 145
          Top = 3
          Width = 24
          Height = 13
          Caption = 'Sexo'
        end
        object Label9: TLabel
          Left = 2
          Top = 1
          Width = 55
          Height = 13
          Caption = 'Estado C'#237'vil'
        end
        object cbSexo: TComboBox
          Left = 145
          Top = 20
          Width = 101
          Height = 21
          Hint = 'SEXO'
          Style = csDropDownList
          TabOrder = 0
        end
        object cbEstadoCivil: TComboBox
          Left = 2
          Top = 20
          Width = 137
          Height = 21
          Hint = 'ESTADO_CIVIL'
          Style = csDropDownList
          TabOrder = 1
        end
      end
      object cbCidades: TComboBox
        Left = 40
        Top = 223
        Width = 257
        Height = 21
        Hint = 'CIDADES'
        Style = csDropDownList
        TabOrder = 7
      end
      object edtEndereco: TEdit
        Left = 40
        Top = 275
        Width = 513
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 9
      end
      object edtBairro: TEdit
        Left = 40
        Top = 321
        Width = 378
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 10
      end
      object edtNumero: TEdit
        Left = 424
        Top = 321
        Width = 129
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 11
      end
      object edtComplemento: TEdit
        Left = 40
        Top = 369
        Width = 513
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 12
      end
      object cbEstados: TComboBox
        Left = 303
        Top = 223
        Width = 250
        Height = 21
        Hint = 'ESTADOS'
        Style = csDropDownList
        TabOrder = 8
      end
    end
  end
  inherited FDMemTable1: TDWMemtable
    object FDMemTable1CD_PESSOAS: TIntegerField
      FieldName = 'CD_PESSOAS'
    end
    object FDMemTable1NM_PESSOAS: TStringField
      FieldName = 'NM_PESSOAS'
      Size = 60
    end
    object FDMemTable1DT_NASCIMENTO: TStringField
      FieldName = 'DT_NASCIMENTO'
    end
    object FDMemTable1CD_SEXO: TIntegerField
      FieldName = 'CD_SEXO'
    end
    object FDMemTable1CPF: TStringField
      FieldName = 'CPF'
    end
    object FDMemTable1CD_ESTADO_CIVIL: TIntegerField
      FieldName = 'CD_ESTADO_CIVIL'
    end
    object FDMemTable1NM_FANTASIA: TStringField
      FieldName = 'NM_FANTASIA'
      Size = 60
    end
    object FDMemTable1CNPJ: TStringField
      FieldName = 'CNPJ'
    end
    object FDMemTable1RAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
    end
    object FDMemTable1TIPO_PESSOA: TIntegerField
      FieldName = 'TIPO_PESSOA'
    end
    object FDMemTable1DT_REGISTRO: TStringField
      FieldName = 'DT_REGISTRO'
    end
    object FDMemTable1CD_USUARIOS: TIntegerField
      FieldName = 'CD_USUARIOS'
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
    object FDMemTable1DS_ENDERECOS: TStringField
      FieldName = 'DS_ENDERECOS'
      Size = 60
    end
    object FDMemTable1CD_ESTADOS: TIntegerField
      FieldName = 'CD_ESTADOS'
    end
    object FDMemTable1DS_ESTADO_CIVIL: TStringField
      FieldName = 'DS_ESTADO_CIVIL'
      Size = 60
    end
    object FDMemTable1DS_CIDADES: TStringField
      FieldName = 'DS_CIDADES'
      Size = 60
    end
    object FDMemTable1DS_ESTADOS: TStringField
      FieldName = 'DS_ESTADOS'
      Size = 60
    end
    object FDMemTable1DS_SEXO: TStringField
      FieldName = 'DS_SEXO'
      Size = 60
    end
  end
end
