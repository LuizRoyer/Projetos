object dm: Tdm
  OldCreateOrder = False
  Height = 182
  Width = 369
  object dbSac: TIBDatabase
    Connected = True
    DatabaseName = 'T:\SAC\Tabelas\SAC.FDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = trSac
    Left = 24
    Top = 8
  end
  object trSac: TIBTransaction
    Active = True
    DefaultDatabase = dbSac
    Left = 96
    Top = 16
  end
  object tbCliente: TIBTable
    Database = dbSac
    Transaction = trSac
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
        Size = 50
      end
      item
        Name = 'EMAIL'
        DataType = ftWideString
        Size = 50
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY1'
        Fields = 'CODIGO'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'TCLIENTE'
    Left = 16
    Top = 72
  end
  object tbFuncionario: TIBTable
    Database = dbSac
    Transaction = trSac
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
    Left = 80
    Top = 72
  end
  object tbChamado: TIBTable
    Database = dbSac
    Transaction = trSac
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
        Size = 1024
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
    Left = 152
    Top = 72
  end
  object tbProblema: TIBTable
    Database = dbSac
    Transaction = trSac
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
        Size = 100
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY4'
        Fields = 'CODIGO'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'TPROBLEMA'
    Left = 216
    Top = 72
  end
  object tbRetorno: TIBTable
    Database = dbSac
    Transaction = trSac
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
        Name = 'OBSERVACAO'
        DataType = ftWideString
        Size = 1024
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
    Left = 280
    Top = 72
  end
  object tbSistema: TIBTable
    Database = dbSac
    Transaction = trSac
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
        Size = 100
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY3'
        Fields = 'CODIGO'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'TSISTEMA'
    Left = 32
    Top = 120
  end
  object tbStatus: TIBTable
    Database = dbSac
    Transaction = trSac
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
        Size = 100
      end
      item
        Name = 'TIPO'
        DataType = ftWideString
        Size = 1
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
    Left = 104
    Top = 120
  end
end
