object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Vendas'
  ClientHeight = 845
  ClientWidth = 891
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = -21
    Top = -4
    Width = 1150
    Height = 125
    Color = clCream
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 48
      Top = 48
      Width = 63
      Height = 13
      Caption = 'Nome Cliente'
    end
    object Label2: TLabel
      Left = 520
      Top = 48
      Width = 63
      Height = 13
      Caption = 'Lista Clientes'
    end
    object edCliente: TEdit
      Left = 128
      Top = 45
      Width = 265
      Height = 21
      TabOrder = 0
    end
    object cbCliente: TComboBox
      Left = 600
      Top = 45
      Width = 145
      Height = 21
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 68
    Width = 897
    Height = 242
    Color = clCream
    ParentBackground = False
    TabOrder = 1
    object Label3: TLabel
      Left = 22
      Top = 32
      Width = 68
      Height = 13
      Caption = 'Nome Produto'
    end
    object Label4: TLabel
      Left = 34
      Top = 80
      Width = 56
      Height = 13
      Caption = 'Quantidade'
    end
    object Label5: TLabel
      Left = 26
      Top = 136
      Width = 64
      Height = 13
      Caption = 'Valor Unitario'
    end
    object Label6: TLabel
      Left = 475
      Top = 48
      Width = 87
      Height = 13
      Caption = 'Lista De Produtos '
    end
    object edProduto: TEdit
      Left = 107
      Top = 29
      Width = 265
      Height = 21
      TabOrder = 0
    end
    object edquantidade: TEdit
      Left = 107
      Top = 77
      Width = 121
      Height = 21
      TabOrder = 1
      OnKeyPress = edquantidadeKeyPress
    end
    object edValorUnitario: TEdit
      Left = 107
      Top = 133
      Width = 121
      Height = 21
      TabOrder = 2
      OnKeyPress = edValorUnitarioKeyPress
    end
    object lsProduto: TListBox
      Left = 579
      Top = 32
      Width = 193
      Height = 209
      ItemHeight = 13
      TabOrder = 3
      OnClick = lsProdutoClick
    end
    object mmVendas: TMemo
      Left = 320
      Top = 120
      Width = 185
      Height = 89
      Lines.Strings = (
        'mmVendas')
      TabOrder = 4
    end
  end
  object TPanel
    Left = 0
    Top = 304
    Width = 903
    Height = 113
    Color = clCream
    ParentBackground = False
    TabOrder = 2
    object btninserir: TButton
      Left = 107
      Top = 40
      Width = 102
      Height = 25
      Caption = 'Inserir'
      TabOrder = 0
      OnClick = btninserirClick
    end
    object btnRemover: TButton
      Left = 272
      Top = 40
      Width = 100
      Height = 25
      Caption = 'Remover'
      TabOrder = 1
      OnClick = btnRemoverClick
    end
  end
  object Panel3: TPanel
    Left = 8
    Top = 808
    Width = 889
    Height = 41
    Color = clCream
    ParentBackground = False
    TabOrder = 3
    object Label8: TLabel
      Left = 656
      Top = 16
      Width = 95
      Height = 13
      Caption = 'Valor Total da Nota '
    end
    object LbTotalNota: TLabel
      Left = 776
      Top = 16
      Width = 3
      Height = 13
    end
    object btnGravar: TButton
      Left = 113
      Top = 8
      Width = 102
      Height = 25
      Caption = 'Gravar'
      TabOrder = 0
      OnClick = btnGravarClick
    end
    object btnSair: TButton
      Left = 278
      Top = 8
      Width = 100
      Height = 25
      Caption = 'Sair'
      TabOrder = 1
      OnClick = btnSairClick
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 416
    Width = 891
    Height = 394
    TabOrder = 4
    object Label7: TLabel
      Left = 616
      Top = 392
      Width = 92
      Height = 13
      Caption = 'Valor Total Da nota'
    end
    object Button1: TButton
      Left = 0
      Top = 7
      Width = 223
      Height = 25
      Caption = 'Produto'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object Button2: TButton
      Left = 240
      Top = 7
      Width = 178
      Height = 25
      Caption = 'Quantidade'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object Button3: TButton
      Left = 456
      Top = 7
      Width = 187
      Height = 25
      Caption = 'Valor Unitario'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object Button4: TButton
      Left = 672
      Top = 7
      Width = 195
      Height = 25
      Caption = 'Valor Total '
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object sgVendas: TStringGrid
      Left = 8
      Top = 38
      Width = 883
      Height = 283
      ColCount = 4
      DefaultColWidth = 220
      FixedColor = clWhite
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      ScrollBars = ssVertical
      TabOrder = 4
      ColWidths = (
        220
        220
        220
        220)
    end
  end
end
