object CodeGenerateFrm: TCodeGenerateFrm
  Left = 247
  Top = 137
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Code Generation'
  ClientHeight = 516
  ClientWidth = 571
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object GenerateGb: TGroupBox
    Left = 5
    Top = 409
    Width = 562
    Height = 60
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Generate Code'
    TabOrder = 2
    TabStop = True
    object RegCodeCopySb: TSpeedButton
      Left = 519
      Top = 21
      Width = 29
      Height = 28
      Hint = 'Copy code to clipboard'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Glyph.Data = {
        76050000424D7605000000000000360400002800000012000000100000000100
        0800000000004001000000000000000000000001000000010000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00740400000000
        0000000000000000000000000000505200001200000010000000120000000100
        0800000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00007400000067000000286003000000000000000000247DE9002C9FEC00B0A2
        EC0000000000000000002000CC00F0740300F479E900E8740300F479E9000000
        000000000000000000000000000000000000000000000000000000000000F479
        E900AA05000000000000147CE900147CE900980000001000000077000000F8FD
        0200000000000000000000000000000000000000000000000000120000001000
        0000040000000100010000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000507AE9006071E90014000000600000007001
        000077000000F8FD020000000000000000000000000000000000000000005052
        0000120000001000000012000000010008000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000207DE900207DE9009002
        0000B47BE9003812DF00E87BE900080000006000000000000000447DE900447D
        E9006C02000000000000AC7DE900D07DE90084A7EC0000000000000000002000
        CC00F0740300247AE900E8740300247AE9000000000000000000000000000000
        000000000000000000000000000000000000247AE900AA05000000000000A87D
        E900A87DE90008020000487DE9003812DF007C7DE90008000000600000002400
        00001F0000003CF50200D4270300487DE9001C17DF007C7DE90004000000E87D
        E900E87DE900C8010000A8000000F50300000000000000000000000000000000
        000000000000000000000000000000000000000000000000000064760600A058
        E400000000000000000000000000DC0C000093000000C89E0500000000000000
        0000000000000000000000000000000000000000000008010000000000000000
        00000001000001000000FFFFFF0000000000000000000000000080010000F503
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000647606002C5BE4000000000000000000000000000000
        0000904FE600B8A7DF00E40000003613000000000000AD260D00E47EE900E47E
        E900CC00000036130000007FE900F70A0200FC7EE900FC7EE900080808080808
        0808080808080808080808080300080808080808080804040404040404040408
        00040808080808080808040F0F0F0F0F0F0F040802000808080808080808040F
        00000000000F0408E1020808000000000000040F0F0F0F0F0F0F0408AE810808
        000F0F0F0F0F040F00000000000F04082A000808000F00000000040F0F0F0F0F
        0F0F040801000808000F0F0F0F0F040F00000F040404040840020808000F0000
        0000040F0F0F0F040F04080802000808000F0F0F0F0F040F0F0F0F0404080808
        FA030808000F00000F000404040404040808080800A00808000F0F0F0F000F00
        0808080808080808AE810808000F0F0F0F000008080808080808080800040808
        0000000000000808080808080808080881000808080808080808080808080808
        0808080800A0080808080808080808080808080808080808AE81}
      OnClick = RegCodeCopySbClick
    end
    object GenerateBtn: TButton
      Left = 10
      Top = 20
      Width = 95
      Height = 30
      Hint = 'Generate code'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '&Generate'
      Default = True
      TabOrder = 0
      OnClick = GenerateBtnClick
    end
    object RegCodeEd: TEdit
      Left = 118
      Top = 22
      Width = 398
      Height = 24
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Ctl3D = True
      ParentColor = True
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
      OnChange = InfoChanged
    end
  end
  object CodesNbk: TTabbedNotebook
    Left = 5
    Top = 5
    Width = 562
    Height = 160
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    PageIndex = 6
    TabsPerRow = 7
    TabFont.Charset = DEFAULT_CHARSET
    TabFont.Color = clBtnText
    TabFont.Height = -11
    TabFont.Name = 'MS Sans Serif'
    TabFont.Style = []
    TabOrder = 0
    OnChange = TabbedNotebook1Change
    object TTabPage
      Left = 4
      Top = 27
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Date'
      object Label9: TLabel
        Left = 5
        Top = 15
        Width = 60
        Height = 16
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Start date:'
      end
      object Label11: TLabel
        Left = 251
        Top = 15
        Width = 57
        Height = 16
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'End date:'
      end
      object StartDateEd: TEdit
        Left = 74
        Top = 10
        Width = 95
        Height = 24
        Hint = 'Code is invalid prior to this date'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        MaxLength = 10
        TabOrder = 0
        OnChange = ParametersChanged
        OnKeyPress = DateEdKeyPress
      end
      object EndDateEd: TEdit
        Left = 320
        Top = 10
        Width = 95
        Height = 24
        Hint = 'Code is invalid after this date'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        MaxLength = 10
        TabOrder = 1
        OnChange = ParametersChanged
        OnKeyPress = DateEdKeyPress
      end
    end
    object TTabPage
      Left = 4
      Top = 27
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Days'
      object Label13: TLabel
        Left = 5
        Top = 15
        Width = 63
        Height = 16
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Day count:'
      end
      object Label2: TLabel
        Left = 281
        Top = 15
        Width = 48
        Height = 16
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Expires:'
      end
      object DaysCountEd: TEdit
        Left = 79
        Top = 10
        Width = 139
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 0
        Text = '0'
        OnChange = ParametersChanged
        OnKeyPress = NumberEdKeyPress
      end
      object DaysExpiresEd: TEdit
        Left = 335
        Top = 10
        Width = 95
        Height = 24
        Hint = 'Code is invalid after this date'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        MaxLength = 10
        TabOrder = 1
        OnChange = ParametersChanged
        OnKeyPress = DateEdKeyPress
      end
    end
    object TTabPage
      Left = 4
      Top = 27
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Reg'
      object Label6: TLabel
        Left = 10
        Top = 15
        Width = 37
        Height = 16
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'String:'
      end
      object RegStrCopySb: TSpeedButton
        Left = 505
        Top = 9
        Width = 28
        Height = 28
        Hint = 'Copy to clipboard'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Glyph.Data = {
          76050000424D7605000000000000360400002800000012000000100000000100
          0800000000004001000000000000000000000001000000010000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00740400000000
          0000000000000000000000000000505200001200000010000000120000000100
          0800000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00007400000067000000286003000000000000000000247DE900542CE800A826
          EC0000000000000000002000CC00F0740300F479E900E8740300F479E9000000
          000000000000000000000000000000000000000000000000000000000000F479
          E900AA05000000000000147CE900147CE900980000001000000077000000F8FD
          0200000000000000000000000000000000000000000000000000120000001000
          0000040000000100010000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000507AE900589FEC0014000000600000007001
          000077000000F8FD020000000000000000000000000000000000000000005052
          0000120000001000000012000000010008000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000207DE900207DE9009002
          0000B47BE9003812DF00E87BE900080000006000000000000000447DE900447D
          E9006C02000000000000AC7DE900D07DE90084A7EC0000000000000000002000
          CC00F0740300247AE900E8740300247AE9000000000000000000000000000000
          000000000000000000000000000000000000247AE900AA05000000000000A87D
          E900A87DE90008020000487DE9003812DF007C7DE90008000000600000002400
          00001F0000003CF50200D4270300487DE9001C17DF007C7DE90004000000E87D
          E900E87DE900C8010000A8000000F50300000000000000000000000000000000
          000000000000000000000000000000000000000000000000000064760600A058
          E400000000000000000000000000DC0C000093000000C89E0500000000000000
          0000000000000000000000000000000000000000000008010000000000000000
          00000001000001000000FFFFFF0000000000000000000000000080010000F503
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000647606002C5BE4000000000000000000000000000000
          0000904FE600B8A7DF00E40000003613000000000000AD260D00E47EE900E47E
          E900CC00000036130000007FE900F70A0200FC7EE900FC7EE900080808080808
          080808080808080808080808E000080808080808080804040404040404040408
          00000808080808080808040F0F0F0F0F0F0F040800000808080808080808040F
          00000000000F040800000808000000000000040F0F0F0F0F0F0F040880010808
          000F0F0F0F0F040F00000000000F040800000808000F00000000040F0F0F0F0F
          0F0F0408F0010808000F0F0F0F0F040F00000F0404040408F8FF0808000F0000
          0000040F0F0F0F040F04080800030808000F0F0F0F0F040F0F0F0F0404080808
          C0030808000F00000F0004040404040408080808E0010808000F0F0F0F000F00
          0808080808080808FFFF0808000F0F0F0F0000080808080808080808FFFF0808
          00000000000008080808080808080808F7810808080808080808080808080808
          08080808C00708080808080808080808080808080808080898C3}
        OnClick = RegStrCopySbClick
      end
      object Label4: TLabel
        Left = 281
        Top = 49
        Width = 48
        Height = 16
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Expires:'
      end
      object RegStrEd: TEdit
        Left = 54
        Top = 10
        Width = 449
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 0
        OnChange = ParametersChanged
      end
      object RegRandomBtn: TButton
        Left = 59
        Top = 44
        Width = 134
        Height = 31
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '&Random Number'
        TabOrder = 1
        OnClick = RegRandomBtnClick
      end
      object RegExpiresEd: TEdit
        Left = 331
        Top = 44
        Width = 95
        Height = 24
        Hint = 'Code is invalid after this date'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        MaxLength = 10
        TabOrder = 2
        OnChange = ParametersChanged
        OnKeyPress = DateEdKeyPress
      end
    end
    object TTabPage
      Left = 4
      Top = 27
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'S/N'
      object Label7: TLabel
        Left = 10
        Top = 15
        Width = 89
        Height = 16
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '&Serial Number:'
      end
      object Label15: TLabel
        Left = 281
        Top = 15
        Width = 48
        Height = 16
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Expires:'
      end
      object SerialNumberEd: TEdit
        Left = 103
        Top = 10
        Width = 130
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 0
        Text = '0'
        OnChange = ParametersChanged
        OnKeyPress = NumberEdKeyPress
      end
      object SerRandomBtn: TButton
        Left = 10
        Top = 44
        Width = 134
        Height = 31
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '&Random Number'
        TabOrder = 2
        OnClick = SerRandomBtnClick
      end
      object SerialExpiresEd: TEdit
        Left = 335
        Top = 10
        Width = 95
        Height = 24
        Hint = 'Code is invalid after this date'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        MaxLength = 10
        TabOrder = 1
        OnChange = ParametersChanged
        OnKeyPress = DateEdKeyPress
      end
    end
    object TTabPage
      Left = 4
      Top = 27
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Usage'
      object Label14: TLabel
        Left = 5
        Top = 15
        Width = 79
        Height = 16
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Usage count:'
      end
      object Label17: TLabel
        Left = 281
        Top = 15
        Width = 48
        Height = 16
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Expires:'
      end
      object UsageCountEd: TEdit
        Left = 94
        Top = 10
        Width = 139
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 0
        Text = '0'
        OnChange = ParametersChanged
        OnKeyPress = NumberEdKeyPress
      end
      object UsageExpiresEd: TEdit
        Left = 335
        Top = 10
        Width = 95
        Height = 24
        Hint = 'Code is invalid after this date'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        MaxLength = 10
        TabOrder = 1
        OnChange = ParametersChanged
        OnKeyPress = DateEdKeyPress
      end
    end
    object TTabPage
      Left = 4
      Top = 27
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Network'
      object Label10: TLabel
        Left = 5
        Top = 15
        Width = 81
        Height = 16
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Access Slots:'
      end
      object NetworkSlotsEd: TEdit
        Left = 94
        Top = 10
        Width = 139
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 0
        Text = '2'
        OnChange = ParametersChanged
        OnKeyPress = NumberEdKeyPress
      end
    end
    object TTabPage
      Left = 4
      Top = 27
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Special'
      object Label12: TLabel
        Left = 5
        Top = 15
        Width = 79
        Height = 16
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Special data:'
      end
      object Label19: TLabel
        Left = 281
        Top = 15
        Width = 48
        Height = 16
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Expires:'
      end
      object SpecialDataEd: TEdit
        Left = 89
        Top = 10
        Width = 139
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 0
        Text = '0'
        OnChange = ParametersChanged
        OnKeyPress = NumberEdKeyPress
      end
      object SpecialExpiresEd: TEdit
        Left = 335
        Top = 10
        Width = 95
        Height = 24
        Hint = 'Code is invalid prior to this date'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        MaxLength = 10
        TabOrder = 1
        OnChange = ParametersChanged
        OnKeyPress = DateEdKeyPress
      end
    end
  end
  object OKBtn: TBitBtn
    Left = 378
    Top = 479
    Width = 92
    Height = 31
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 3
    OnClick = ParametersChanged
  end
  object CancelBtn: TBitBtn
    Left = 475
    Top = 479
    Width = 92
    Height = 31
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
  end
  object GroupBox1: TGroupBox
    Left = 5
    Top = 167
    Width = 562
    Height = 238
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = '&Key used to encode'
    TabOrder = 1
    object Label5: TLabel
      Left = 15
      Top = 182
      Width = 26
      Height = 16
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Key:'
    end
    object GenerateKeySb: TSpeedButton
      Left = 524
      Top = 201
      Width = 29
      Height = 28
      Hint = 'Generate key'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Glyph.Data = {
        76050000424D7605000000000000360400002800000012000000100000000100
        0800000000004001000000000000000000000001000000010000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00740400000000
        0000000000000000000000000000505200001200000010000000120000000100
        0800000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00007400000067000000286003000000000000000000247DE9002C9FEC00D031
        E80000000000000000002000CC00F0740300F479E900E8740300F479E9000000
        000000000000000000000000000000000000000000000000000000000000F479
        E900AA05000000000000147CE900147CE900980000001000000077000000F8FD
        0200000000000000000000000000000000000000000000000000120000001000
        0000040000000100010000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000507AE900589FEC0014000000600000007001
        000077000000F8FD020000000000000000000000000000000000000000005052
        0000120000001000000012000000010008000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000207DE900207DE9009002
        0000B47BE9003812DF00E87BE900080000006000000000000000447DE900447D
        E9006C02000000000000AC7DE900D07DE90084A7EC0000000000000000002000
        CC00F0740300247AE900E8740300247AE9000000000000000000000000000000
        000000000000000000000000000000000000247AE900AA05000000000000A87D
        E900A87DE90008020000487DE9003812DF007C7DE90008000000600000002400
        00001F0000003CF50200D4270300487DE9001C17DF007C7DE90004000000E87D
        E900E87DE900C8010000A8000000F50300000000000000000000000000000000
        000000000000000000000000000000000000000000000000000064760600A058
        E400000000000000000000000000DC0C000093000000C89E0500000000000000
        0000000000000000000000000000000000000000000008010000000000000000
        00000001000001000000FFFFFF0000000000000000000000000080010000F503
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000647606002C5BE4000000000000000000000000000000
        0000904FE600B8A7DF00E40000003613000000000000AD260D00E47EE900E47E
        E900CC00000036130000007FE900F70A0200FC7EE900FC7EE900080808080808
        0808080808080808080808080100080808080808080808080808080808080808
        0100080808080808080808080808080808080808FFFF08080808080808080808
        0808080808080808020008080808000000080808080808080808080808020808
        080000000000080800080808080008083A010808000009080900000800080000
        08000808BB00080800000809080000000000000000000808D202080800000809
        080000000000000000000808D202080800000908090000080808080808080808
        0200080808000000000008080808080808080808340108080808000000080808
        0808080808080808060008080808080808080808080808080808080808000808
        08080808080808080808080808080808D2020808080808080808080808080808
        08080808D2020808080808080808080808080808080808080200}
      OnClick = GenerateKeySbClick
    end
    object Label1: TLabel
      Left = 10
      Top = 132
      Width = 51
      Height = 16
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Modifier:'
    end
    object UniqueModifierCb: TCheckBox
      Left = 374
      Top = 20
      Width = 129
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Unique modifier'
      TabOrder = 3
      OnClick = ModifierClick
    end
    object MachineModifierCb: TCheckBox
      Left = 187
      Top = 20
      Width = 129
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Machine modifier'
      TabOrder = 1
      OnClick = ModifierClick
    end
    object DateModifierCb: TCheckBox
      Left = 20
      Top = 59
      Width = 129
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Date modifier'
      TabOrder = 2
      OnClick = ModifierClick
    end
    object NoModifierCb: TCheckBox
      Left = 20
      Top = 20
      Width = 129
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'No modifier'
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = ModifierClick
    end
    object ModifierEd: TEdit
      Left = 10
      Top = 153
      Width = 208
      Height = 24
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
      OnChange = ParametersChanged
      OnKeyPress = ModifierEdKeyPress
    end
    object ModDateEd: TEdit
      Left = 137
      Top = 55
      Width = 94
      Height = 24
      Hint = 'Code is invalid after this date'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Color = clBtnFace
      Enabled = False
      MaxLength = 10
      TabOrder = 4
      OnChange = ModifierClick
      OnKeyPress = DateEdKeyPress
    end
    object BlockKeyEd: TEdit
      Left = 10
      Top = 202
      Width = 511
      Height = 24
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 6
      OnChange = InfoChanged
    end
    object StringModifierCb: TCheckBox
      Left = 20
      Top = 89
      Width = 119
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'String Modifier'
      TabOrder = 7
      OnClick = ModifierClick
    end
    object ModStringEd: TEdit
      Left = 137
      Top = 85
      Width = 384
      Height = 24
      Hint = 'Code is invalid after this date'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Color = clBtnFace
      Enabled = False
      TabOrder = 8
      OnChange = ModifierClick
    end
  end
end
