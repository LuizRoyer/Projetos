object FRFornecedor: TFRFornecedor
  Left = 0
  Top = 0
  Caption = 'Relatorio Fornecedor'
  ClientHeight = 459
  ClientWidth = 728
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
    Width = 728
    Height = 459
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
      Top = 64
      Width = 726
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
      ExplicitLeft = 0
      ExplicitTop = 17
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
  object DSP2: TDataSetProvider
    Left = 272
    Top = 136
  end
  object rvprjFornecedor: TRvProject
    Engine = rvsysFornecedor
    ProjectFile = 'D:\Aula_OO_Vilson\22_06_18\RelatorioFornecedor.rav'
    Left = 200
    Top = 168
  end
  object rvsysFornecedor: TRvSystem
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
  object DSP1: TDataSetProvider
    DataSet = SQL
    Left = 272
    Top = 248
  end
  object CDS1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP1'
    Left = 408
    Top = 248
  end
  object rvdsFornecedor: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = CDS1
    Left = 352
    Top = 160
  end
  object SQL: TSQLQuery
    Active = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select * from Pessoa where tipo ='#39'F'#39)
    SQLConnection = Data.SQLConnection1
    Left = 496
    Top = 152
  end
end
