object DM: TDM
  OldCreateOrder = False
  Height = 399
  Width = 365
  object DBSAC: TIBDatabase
    Connected = True
    DatabaseName = 'T:\Felipe\Sac\Tabelas\SAC.FDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = TRSAC
    Left = 88
    Top = 48
  end
  object TRSAC: TIBTransaction
    Active = True
    DefaultDatabase = DBSAC
    Left = 192
    Top = 48
  end
  object TBCliente: TIBTable
    Database = DBSAC
    Transaction = TRSAC
    Active = True
    FieldDefs = <
      item
        Name = 'CODIGO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NOME'
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'FONE'
        DataType = ftWideString
        Size = 10
      end
      item
        Name = 'EMAIL'
        DataType = ftWideString
        Size = 20
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY1'
        Fields = 'CODIGO'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'TCLIENTE'
    Left = 32
    Top = 120
  end
  object TBFuncionario: TIBTable
    Database = DBSAC
    Transaction = TRSAC
    Active = True
    FieldDefs = <
      item
        Name = 'CODIGO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NOME'
        DataType = ftWideString
        Size = 100
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY2'
        Fields = 'CODIGO'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'TFUNCIONARIO'
    Left = 96
    Top = 120
  end
  object TBChamado: TIBTable
    Database = DBSAC
    Transaction = TRSAC
    Active = True
    FieldDefs = <
      item
        Name = 'CODIGO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CLIENTE'
        DataType = ftInteger
      end
      item
        Name = 'FUNCIONARIO'
        DataType = ftInteger
      end
      item
        Name = 'SISTEMA'
        DataType = ftInteger
      end
      item
        Name = 'PROBLEMA'
        DataType = ftInteger
      end
      item
        Name = 'DTCHAMADO'
        DataType = ftDate
      end
      item
        Name = 'HRCHAMADO'
        DataType = ftTime
      end
      item
        Name = 'OBSERVACAO'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'STATUS'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY6'
        Fields = 'CODIGO'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN7'
        Fields = 'CLIENTE'
      end
      item
        Name = 'RDB$FOREIGN8'
        Fields = 'FUNCIONARIO'
      end
      item
        Name = 'RDB$FOREIGN9'
        Fields = 'SISTEMA'
      end
      item
        Name = 'RDB$FOREIGN10'
        Fields = 'PROBLEMA'
      end
      item
        Name = 'RDB$FOREIGN11'
        Fields = 'STATUS'
      end>
    StoreDefs = True
    TableName = 'TCHAMADO'
    Left = 160
    Top = 120
  end
  object TBRetorno: TIBTable
    Database = DBSAC
    Transaction = TRSAC
    Active = True
    FieldDefs = <
      item
        Name = 'CODIGO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CHAMADO'
        DataType = ftInteger
      end
      item
        Name = 'FUNCIONARIO'
        DataType = ftInteger
      end
      item
        Name = 'STATUS'
        DataType = ftInteger
      end
      item
        Name = 'DTRETORNO'
        DataType = ftDate
      end
      item
        Name = 'HRRETORNO'
        DataType = ftTime
      end
      item
        Name = 'OBSERVAQCAO'
        DataType = ftWideString
        Size = 255
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY12'
        Fields = 'CODIGO'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN13'
        Fields = 'CHAMADO'
      end
      item
        Name = 'RDB$FOREIGN14'
        Fields = 'FUNCIONARIO'
      end
      item
        Name = 'RDB$FOREIGN15'
        Fields = 'STATUS'
      end>
    StoreDefs = True
    TableName = 'TRETORNO'
    Left = 48
    Top = 216
  end
  object TBSistema: TIBTable
    Database = DBSAC
    Transaction = TRSAC
    Active = True
    FieldDefs = <
      item
        Name = 'CODIGO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'IDENTIFICACAO'
        DataType = ftWideString
        Size = 255
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY3'
        Fields = 'CODIGO'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'TSISTEMA'
    Left = 136
    Top = 216
  end
  object TBStatus: TIBTable
    Database = DBSAC
    Transaction = TRSAC
    Active = True
    FieldDefs = <
      item
        Name = 'CODIGO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        DataType = ftWideString
        Size = 200
      end
      item
        Name = 'TIPO'
        DataType = ftWideString
        Size = 2
      end
      item
        Name = 'CORFUNDO'
        DataType = ftWideString
        Size = 50
      end
      item
        Name = 'CORFONTE'
        DataType = ftWideString
        Size = 50
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY5'
        Fields = 'CODIGO'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'TSTATUS'
    Left = 224
    Top = 224
  end
  object TBProblema: TIBTable
    Database = DBSAC
    Transaction = TRSAC
    Active = True
    FieldDefs = <
      item
        Name = 'CODIGO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        DataType = ftWideString
        Size = 255
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY4'
        Fields = 'CODIGO'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'TPROBLEMA'
    Left = 224
    Top = 120
  end
end
