object FRProduto: TFRProduto
  Left = 0
  Top = 0
  Caption = 'Relatorio de  Produto'
  ClientHeight = 362
  ClientWidth = 556
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
    Width = 556
    Height = 362
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    ExplicitLeft = -8
    ExplicitTop = -8
    object Label6: TLabel
      Left = 3
      Top = 25
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Button1: TButton
      Left = 347
      Top = 20
      Width = 75
      Height = 25
      Caption = 'Ver Relatorio'
      TabOrder = 0
      OnClick = Button1Click
    end
    object ListView1: TListView
      Left = 1
      Top = 51
      Width = 554
      Height = 310
      Align = alBottom
      Columns = <
        item
          Caption = 'indice'
        end
        item
          Caption = 'Descri'#231#227'o'
          Width = 200
        end
        item
          Caption = 'Unidade'
          Width = 100
        end
        item
          Caption = 'Valor'
        end
        item
          Caption = 'Estoque'
          Width = 100
        end>
      Groups = <
        item
          GroupID = 0
          State = [lgsNormal]
          HeaderAlign = taLeftJustify
          FooterAlign = taLeftJustify
          Subtitle = 'Indice'
          TitleImage = -1
        end
        item
          GroupID = 1
          State = [lgsNormal]
          HeaderAlign = taLeftJustify
          FooterAlign = taLeftJustify
          Subtitle = 'Descri'#231#227'o'
          TitleImage = -1
        end
        item
          GroupID = 2
          State = [lgsNormal]
          HeaderAlign = taLeftJustify
          FooterAlign = taLeftJustify
          Subtitle = 'Unidade'
          TitleImage = -1
        end
        item
          GroupID = 3
          State = [lgsNormal]
          HeaderAlign = taLeftJustify
          FooterAlign = taLeftJustify
          Subtitle = 'Valor'
          TitleImage = -1
        end
        item
          GroupID = 4
          State = [lgsNormal]
          HeaderAlign = taLeftJustify
          FooterAlign = taLeftJustify
          Subtitle = 'Estoque'
          TitleImage = -1
        end>
      TabOrder = 1
      ViewStyle = vsReport
    end
    object btnPesquisar: TButton
      Left = 251
      Top = 20
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = btnPesquisarClick
    end
    object txtCnpJCpf: TEdit
      Left = 36
      Top = 22
      Width = 209
      Height = 21
      TabOrder = 3
    end
  end
  object rvsysProduto: TRvSystem
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
  object rvprjProduto: TRvProject
    Engine = rvsysProduto
    ProjectFile = 'D:\Aula_OO_Vilson\22_06_18\RelatorioProduto.rav'
    Left = 200
    Top = 168
  end
  object rvdsProduto: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = CDS2
    Left = 352
    Top = 160
  end
  object SQL2: TSQLQuery
    Active = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select * from produto '
      '')
    SQLConnection = Data.SQLConnection1
    Left = 496
    Top = 152
  end
  object CDS2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP2'
    Left = 408
    Top = 248
  end
  object DSP2: TDataSetProvider
    DataSet = SQL2
    Left = 272
    Top = 248
  end
end
