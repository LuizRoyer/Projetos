object FPessoas: TFPessoas
  Left = 0
  Top = 0
  Caption = 'Publico'
  ClientHeight = 475
  ClientWidth = 970
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
    Width = 970
    Height = 475
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 20
      Top = 35
      Width = 33
      Height = 13
      Caption = 'Codigo'
    end
    object Label3: TLabel
      Left = 440
      Top = 35
      Width = 81
      Height = 13
      Caption = 'Data Nascimento'
    end
    object Label4: TLabel
      Left = 8
      Top = 83
      Width = 45
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object Label2: TLabel
      Left = 140
      Top = 35
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label5: TLabel
      Left = 240
      Top = 83
      Width = 39
      Height = 13
      Caption = 'Contato'
    end
    object Label6: TLabel
      Left = 232
      Top = 137
      Width = 12
      Height = 13
      Caption = '...'
    end
    object txtid: TEdit
      Left = 64
      Top = 32
      Width = 49
      Height = 21
      Enabled = False
      TabOrder = 12
    end
    object rbCliente: TRadioButton
      Left = 8
      Top = 136
      Width = 113
      Height = 17
      Caption = 'Cliente'
      TabOrder = 4
    end
    object rbFornecedor: TRadioButton
      Left = 80
      Top = 136
      Width = 87
      Height = 17
      Caption = 'Fornecedor'
      TabOrder = 10
    end
    object txtEndereco: TEdit
      Left = 56
      Top = 80
      Width = 178
      Height = 21
      TabOrder = 2
    end
    object txtNome: TEdit
      Left = 173
      Top = 32
      Width = 233
      Height = 21
      TabOrder = 0
    end
    object txtContato: TEdit
      Left = 285
      Top = 80
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object txtCnpJCpf: TEdit
      Left = 256
      Top = 134
      Width = 209
      Height = 21
      TabOrder = 5
    end
    object ListView1: TListView
      Left = 1
      Top = 216
      Width = 968
      Height = 258
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
      TabOrder = 11
      ViewStyle = vsReport
      OnSelectItem = ListView1SelectItem
    end
    object btnSalvar: TButton
      Left = 20
      Top = 185
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 6
      OnClick = btnSalvarClick
    end
    object btnAlterar: TButton
      Left = 118
      Top = 185
      Width = 75
      Height = 25
      Caption = 'Alterar'
      TabOrder = 7
      OnClick = btnAlterarClick
    end
    object btnExcluir: TButton
      Left = 220
      Top = 185
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 8
      OnClick = btnExcluirClick
    end
    object btnPesquisar: TButton
      Left = 324
      Top = 185
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 9
      OnClick = btnPesquisarClick
    end
    object DataNasc: TEdit
      Left = 527
      Top = 32
      Width = 154
      Height = 21
      TabOrder = 1
    end
  end
end
