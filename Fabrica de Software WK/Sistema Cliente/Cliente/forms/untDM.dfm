object DM: TDM
  OldCreateOrder = False
  Height = 256
  Width = 501
  object DWClientEvents1: TDWClientEvents
    ServerEventName = 'TServerModule.DWServerEvents1'
    CriptOptions.Use = False
    CriptOptions.Key = 'RDWBASEKEY256'
    RESTClientPooler = RESTClientPooler1
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
      end>
    Left = 112
    Top = 160
  end
  object RESTClientPooler1: TRESTClientPooler
    DataCompression = True
    Encoding = esUtf8
    hEncodeStrings = True
    Host = '192.168.0.11'
    UserName = 'admin'
    Password = 'admin'
    ProxyOptions.BasicAuthentication = False
    ProxyOptions.ProxyPort = 0
    RequestTimeOut = 10000
    ThreadRequest = False
    AllowCookies = False
    HandleRedirects = False
    FailOver = False
    FailOverConnections = <>
    FailOverReplaceDefaults = False
    BinaryRequest = False
    CriptOptions.Use = False
    CriptOptions.Key = 'RDWBASEKEY256'
    Left = 112
    Top = 96
  end
  object FDMemTable2: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 112
    Top = 32
  end
  object ClientSQL1: TRESTDWClientSQL
    Active = False
    Filtered = False
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    MasterCascadeDelete = True
    BinaryRequest = False
    Datapacks = -1
    DataCache = False
    Params = <>
    CacheUpdateRecords = True
    AutoCommitData = False
    AutoRefreshAfterCommit = False
    RaiseErrors = True
    ActionCursor = crSQLWait
    ReflectChanges = False
    Left = 280
    Top = 96
  end
end
