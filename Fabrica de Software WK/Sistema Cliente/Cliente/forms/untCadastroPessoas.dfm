inherited frmCadastroPessoas: TfrmCadastroPessoas
  Caption = 'Cadastro de Pessoas'
  ClientHeight = 404
  ClientWidth = 592
  ExplicitWidth = 598
  ExplicitHeight = 433
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 592
    Height = 404
    ActivePage = tabEdicao
    ExplicitWidth = 592
    ExplicitHeight = 404
    inherited tabPrincipal: TTabSheet
      ExplicitWidth = 584
      ExplicitHeight = 376
      inherited Panel1: TPanel
        Width = 584
        ExplicitWidth = 584
        inherited Shape1: TShape
          Width = 574
          ExplicitWidth = 574
        end
      end
      inherited DBGrid1: TDBGrid
        Width = 574
        Height = 277
      end
      inherited Panel2: TPanel
        Top = 344
        Width = 584
        ExplicitTop = 344
        ExplicitWidth = 584
        inherited btnNovoRegistro: TButton
          Left = 484
          ExplicitLeft = 484
        end
      end
    end
    inherited tabEdicao: TTabSheet
      ExplicitWidth = 584
      ExplicitHeight = 376
      inherited Shape2: TShape
        Width = 574
        Height = 334
        ExplicitWidth = 574
        ExplicitHeight = 334
      end
      inherited Label2: TLabel
        Left = 188
        Top = 85
        Width = 34
        Caption = 'Pessoa'
        ExplicitLeft = 188
        ExplicitTop = 85
        ExplicitWidth = 34
      end
      object Label15: TLabel [4]
        Left = 40
        Top = 134
        Width = 72
        Height = 13
        Caption = 'Data de Nasc.:'
      end
      object Label7: TLabel [5]
        Left = 188
        Top = 134
        Width = 45
        Height = 13
        Caption = 'Endere'#231'o'
      end
      object Label8: TLabel [6]
        Left = 40
        Top = 182
        Width = 72
        Height = 13
        Caption = 'Tipo de Pessoa'
      end
      object Label5: TLabel [7]
        Left = 40
        Top = 228
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
      object lblNomeFantasia: TLabel [8]
        Left = 188
        Top = 182
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
      object lblRazaoSocial: TLabel [9]
        Left = 188
        Top = 228
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
      inherited edtDescricao: TEdit
        Left = 188
        Top = 104
        Width = 357
        ExplicitLeft = 188
        ExplicitTop = 104
        ExplicitWidth = 357
      end
      inherited Panel3: TPanel
        Top = 344
        Width = 584
        TabOrder = 8
        ExplicitTop = 344
        ExplicitWidth = 584
        inherited btnSalvar: TButton
          Left = 484
          ExplicitLeft = 484
        end
        inherited btnCancelar: TButton
          Left = 364
          ExplicitLeft = 364
        end
      end
      object edtDataNascimento: TDateTimePicker
        Left = 40
        Top = 151
        Width = 143
        Height = 21
        Date = 43902.000000000000000000
        Time = 0.822922442130220600
        TabOrder = 2
      end
      object cbEnderecos: TComboBox
        Left = 189
        Top = 153
        Width = 357
        Height = 21
        Hint = 'ENDERECOS'
        Style = csDropDownList
        TabOrder = 3
      end
      object cbTipoPessoa: TComboBox
        Left = 40
        Top = 199
        Width = 143
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 4
        Text = 'Pessoa F'#237'sica'
        OnCloseUp = cbTipoPessoaCloseUp
        Items.Strings = (
          'Pessoa F'#237'sica'
          'Pessoa Jur'#237'dica')
      end
      object edtCPFCNPJ: TEdit
        Left = 40
        Top = 247
        Width = 143
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 5
      end
      object edtRazaoSocial: TEdit
        Left = 188
        Top = 247
        Width = 214
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 6
        Visible = False
      end
      object edtNomeFantasia: TEdit
        Left = 189
        Top = 201
        Width = 357
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 7
        Visible = False
      end
      object Panel4: TPanel
        Left = 232
        Top = 27
        Width = 262
        Height = 46
        BevelOuter = bvNone
        TabOrder = 9
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
    end
  end
end
