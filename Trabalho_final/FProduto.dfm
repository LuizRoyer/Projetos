object FProdutos: TFProdutos
  Left = 0
  Top = 0
  Caption = 'Produtos'
  ClientHeight = 477
  ClientWidth = 522
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
    Width = 522
    Height = 477
    Align = alClient
    AutoSize = True
    TabOrder = 0
    object Label1: TLabel
      Left = 20
      Top = 35
      Width = 33
      Height = 13
      Caption = 'Codigo'
    end
    object Label2: TLabel
      Left = 128
      Top = 35
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label3: TLabel
      Left = 180
      Top = 91
      Width = 39
      Height = 13
      Caption = 'Estoque'
    end
    object Label4: TLabel
      Left = 300
      Top = 91
      Width = 39
      Height = 13
      Caption = 'Unidade'
    end
    object Label5: TLabel
      Left = 20
      Top = 91
      Width = 64
      Height = 13
      Caption = 'Valor Unitario'
    end
    object txtid: TEdit
      Left = 64
      Top = 32
      Width = 49
      Height = 21
      Enabled = False
      TabOrder = 8
    end
    object txtDescricao: TEdit
      Left = 180
      Top = 32
      Width = 241
      Height = 21
      TabOrder = 0
    end
    object txtEstoque: TEdit
      Left = 225
      Top = 88
      Width = 64
      Height = 21
      TabOrder = 2
    end
    object txtValorUnit: TEdit
      Left = 90
      Top = 88
      Width = 63
      Height = 21
      TabOrder = 1
    end
    object cbUnidade: TComboBox
      Left = 352
      Top = 88
      Width = 69
      Height = 21
      TabOrder = 3
      Items.Strings = (
        'Pacote'
        'Kg'
        'Unidade'
        'Peca'
        'Litro')
    end
    object ListView1: TListView
      Left = 1
      Top = 218
      Width = 520
      Height = 258
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
      TabOrder = 9
      ViewStyle = vsReport
      OnSelectItem = ListView1SelectItem
    end
    object btnAlterar: TButton
      Left = 118
      Top = 161
      Width = 75
      Height = 25
      Caption = 'Alterar'
      TabOrder = 5
      OnClick = btnAlterarClick
    end
    object btnSalvar: TButton
      Left = 20
      Top = 161
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 4
      OnClick = btnSalvarClick
    end
    object btnExcluir: TButton
      Left = 225
      Top = 161
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 6
      OnClick = btnExcluirClick
    end
    object btnPesquisar: TButton
      Left = 324
      Top = 161
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 7
      OnClick = btnPesquisarClick
    end
  end
end
