object ServerModule: TServerModule
  OldCreateOrder = False
  Encoding = esASCII
  OnWelcomeMessage = ServerMethodDataModuleWelcomeMessage
  Height = 176
  Width = 267
  object DWServerEvents1: TDWServerEvents
    IgnoreInvalidParams = False
    Events = <
      item
        Routes = [crAll]
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'SQL'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odOUT
            ObjectValue = ovString
            ParamName = 'Result'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'Tabela'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'Token'
            Encoded = True
          end>
        JsonMode = jmDataware
        Name = 'Gravar'
        OnReplyEvent = DWServerEvents1EventsGravarReplyEvent
      end
      item
        Routes = [crAll]
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'SQL'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odOUT
            ObjectValue = ovString
            ParamName = 'Result'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'Token'
            Encoded = True
          end>
        JsonMode = jmPureJSON
        Name = 'Retornar'
        OnReplyEvent = DWServerEvents1EventsRetornarReplyEvent
      end
      item
        Routes = [crAll]
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'SQL'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odOUT
            ObjectValue = ovString
            ParamName = 'Result'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'Tabela'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'ID'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'Token'
            Encoded = True
          end>
        JsonMode = jmDataware
        Name = 'Deletar'
        OnReplyEvent = DWServerEvents1EventsDeletarReplyEvent
      end
      item
        Routes = [crAll]
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'SQL'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odOUT
            ObjectValue = ovString
            ParamName = 'Result'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'Tabela'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'ID'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'Token'
            Encoded = True
          end>
        JsonMode = jmDataware
        Name = 'Atualizar'
        OnReplyEvent = DWServerEvents1EventsAtualizarReplyEvent
      end>
    Left = 160
    Top = 88
  end
  object RESTDWPoolerDB1: TRESTDWPoolerDB
    Compression = True
    Encoding = esUtf8
    StrsTrim = False
    StrsEmpty2Null = False
    StrsTrim2Len = True
    Active = True
    PoolerOffMessage = 'RESTPooler not active.'
    ParamCreate = True
    Left = 160
    Top = 24
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 40
    Top = 88
  end
  object FDConnection1: TFDConnection
    LoginPrompt = False
    Left = 40
    Top = 24
  end
end
