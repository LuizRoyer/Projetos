object FRCliente: TFRCliente
  Left = 0
  Top = 0
  Caption = 'Relatorio Cliente'
  ClientHeight = 467
  ClientWidth = 671
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 671
    Height = 467
    Align = alClient
    TabOrder = 0
    object Label6: TLabel
      Left = 16
      Top = 17
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object btnPesquisar: TButton
      Left = 264
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 0
      OnClick = btnPesquisarClick
    end
    object txtCnpJCpf: TEdit
      Left = 49
      Top = 14
      Width = 209
      Height = 21
      TabOrder = 1
    end
    object ListView1: TListView
      Left = 1
      Top = 72
      Width = 669
      Height = 394
      Align = alBottom
      Columns = <
        item
          Caption = 'Identificador'
          Width = 75
        end
        item
          Caption = 'nome'
          Width = 200
        end
        item
          Caption = 'Endere'#231'o'
          Width = 100
        end
        item
          Caption = 'Contato'
          Width = 100
        end
        item
          Caption = 'data Nascimento'
          Width = 120
        end
        item
          Caption = 'tipo'
        end
        item
          Caption = 'Cpf'
        end
        item
          Caption = 'Cnpj'
        end>
      TabOrder = 2
      ViewStyle = vsReport
    end
    object Button1: TButton
      Left = 360
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Ver Relatorio'
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  object TSQLQuery1: TSQLQuery
    Active = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select * from Pessoa where tipo ='#39'C'#39)
    SQLConnection = Data.SQLConnection1
    Left = 496
    Top = 152
  end
  object rvsysPessoa: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'Rave Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 72
    Top = 184
  end
  object rvprjPessoa: TRvProject
    Engine = rvsysPessoa
    ProjectFile = 'D:\Aula_OO_Vilson\22_06_18\RelatorioCliente.rav'
    Left = 200
    Top = 168
  end
  object rvdsPessoa: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = ClientDataSet1
    Left = 352
    Top = 160
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 408
    Top = 248
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = TSQLQuery1
    Left = 272
    Top = 248
  end
end
