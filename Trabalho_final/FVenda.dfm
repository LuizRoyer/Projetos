object FVendas: TFVendas
  Left = 0
  Top = 0
  Caption = 'Vendas'
  ClientHeight = 442
  ClientWidth = 826
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
    Width = 826
    Height = 442
    Align = alTop
    TabOrder = 0
    object Label10: TLabel
      Left = 4
      Top = 214
      Width = 56
      Height = 13
      Caption = 'Quantidade'
    end
    object Label11: TLabel
      Left = 496
      Top = 169
      Width = 39
      Height = 13
      Caption = 'Estoque'
    end
    object Label2: TLabel
      Left = 10
      Top = 35
      Width = 66
      Height = 13
      Caption = 'Codigo Venda'
    end
    object Label3: TLabel
      Left = 8
      Top = 78
      Width = 68
      Height = 13
      Caption = 'codigo Pessoa'
    end
    object Label4: TLabel
      Left = 390
      Top = 78
      Width = 50
      Height = 13
      Caption = 'CNPJ_CPF'
    end
    object Label5: TLabel
      Left = 153
      Top = 78
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label6: TLabel
      Left = 346
      Top = 169
      Width = 53
      Height = 13
      Caption = 'R$ Unitatio'
    end
    object Label7: TLabel
      Left = 98
      Top = 169
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label8: TLabel
      Left = 4
      Top = 150
      Width = 74
      Height = 13
      Caption = 'Codigo Produto'
    end
    object Label9: TLabel
      Left = 135
      Top = 214
      Width = 64
      Height = 13
      Caption = 'R$ Acrescimo'
    end
    object Label12: TLabel
      Left = 150
      Top = 35
      Width = 31
      Height = 13
      Caption = 'Status'
    end
    object Label13: TLabel
      Left = 8
      Top = 131
      Width = 33
      Height = 13
      Caption = 'VENDA'
    end
    object Label14: TLabel
      Left = 283
      Top = 214
      Width = 61
      Height = 13
      Caption = 'R$ Desconto'
    end
    object txtIdV: TEdit
      Left = 82
      Top = 30
      Width = 49
      Height = 21
      Enabled = False
      TabOrder = 15
    end
    object txtEstoque: TEdit
      Left = 540
      Top = 166
      Width = 49
      Height = 21
      TabOrder = 16
    end
    object txtIdPes: TEdit
      Left = 82
      Top = 75
      Width = 49
      Height = 21
      TabOrder = 0
    end
    object txtCnpjCpf: TEdit
      Left = 446
      Top = 75
      Width = 123
      Height = 21
      TabOrder = 17
    end
    object txtNome: TEdit
      Left = 183
      Top = 75
      Width = 178
      Height = 21
      TabOrder = 18
    end
    object txtPrecoUnit: TEdit
      Left = 406
      Top = 166
      Width = 49
      Height = 21
      TabOrder = 19
    end
    object txtDescricao: TEdit
      Left = 150
      Top = 166
      Width = 179
      Height = 21
      TabOrder = 20
    end
    object txtidProduto: TEdit
      Left = 11
      Top = 167
      Width = 49
      Height = 21
      Enabled = False
      TabOrder = 2
    end
    object txtAcrescimo: TEdit
      Left = 205
      Top = 211
      Width = 49
      Height = 21
      TabOrder = 5
    end
    object txtQuantidade: TEdit
      Left = 66
      Top = 211
      Width = 49
      Height = 21
      TabOrder = 4
    end
    object cbStatus: TComboBox
      Left = 187
      Top = 32
      Width = 91
      Height = 21
      TabOrder = 21
      Items.Strings = (
        'Andamento'
        'Finalizado'
        'Produto')
    end
    object RadioButton1: TRadioButton
      Left = 296
      Top = 34
      Width = 66
      Height = 17
      Caption = 'Cliente'
      TabOrder = 22
    end
    object RadioButton2: TRadioButton
      Left = 368
      Top = 34
      Width = 87
      Height = 17
      Caption = 'Fornecedor'
      TabOrder = 23
    end
    object Button1: TButton
      Left = 129
      Top = 74
      Width = 22
      Height = 23
      Caption = '...'
      TabOrder = 1
      OnClick = Button1Click
    end
    object btnAlterar: TButton
      Left = 567
      Top = 23
      Width = 75
      Height = 25
      Caption = 'Alterar'
      TabOrder = 12
      OnClick = btnAlterarClick
    end
    object btnSalvar: TButton
      Left = 486
      Top = 23
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 11
      OnClick = btnSalvarClick
    end
    object Panel2: TPanel
      Left = 0
      Top = 128
      Width = 659
      Height = 1
      Caption = 'Panel2'
      TabOrder = 24
    end
    object txtDesconto: TEdit
      Left = 350
      Top = 211
      Width = 49
      Height = 21
      TabOrder = 6
    end
    object ListView1: TListView
      Left = 1
      Top = 248
      Width = 824
      Height = 193
      Align = alBottom
      Columns = <
        item
          Caption = 'Identificador'
          Width = 75
        end
        item
          Caption = 'Produto'
          Width = 230
        end
        item
          Caption = 'quantidade venda'
          Width = 100
        end
        item
          Caption = 'valor Unitariio'
          Width = 85
        end
        item
          Caption = 'desconto'
          Width = 70
        end
        item
          Caption = 'acrecimo'
          Width = 60
        end
        item
          Caption = 'valor Produto'
          Width = 90
        end
        item
          Caption = 'Valor Total'
          Width = 100
        end>
      TabOrder = 25
      ViewStyle = vsReport
      OnSelectItem = ListView1SelectItem
    end
    object Button2: TButton
      Left = 59
      Top = 166
      Width = 20
      Height = 22
      Caption = '...'
      TabOrder = 3
      OnClick = Button2Click
    end
    object Button6: TButton
      Left = 648
      Top = 23
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 13
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 452
      Top = 209
      Width = 89
      Height = 25
      Caption = 'Alterar Item'
      TabOrder = 8
      OnClick = Button7Click
    end
    object Button9: TButton
      Left = 547
      Top = 209
      Width = 81
      Height = 25
      Caption = 'Excluir Item'
      TabOrder = 9
      OnClick = Button9Click
    end
    object Button3: TButton
      Left = 634
      Top = 209
      Width = 75
      Height = 25
      Caption = 'Comprar Item'
      TabOrder = 7
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 729
      Top = 23
      Width = 75
      Height = 26
      Caption = 'Nova Compra'
      TabOrder = 14
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 715
      Top = 209
      Width = 89
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 10
      OnClick = Button5Click
    end
  end
end
