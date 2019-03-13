object FCad_Funcionario: TFCad_Funcionario
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Cadastro De Funcionarios'
  ClientHeight = 648
  ClientWidth = 881
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 881
    Height = 145
    Align = alTop
    TabOrder = 0
    VerticalAlignment = taAlignTop
    object Label1: TLabel
      Left = 160
      Top = 40
      Width = 33
      Height = 13
      Caption = 'Codigo'
    end
    object Label2: TLabel
      Left = 166
      Top = 88
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object edNome: TDBEdit
      Left = 199
      Top = 85
      Width = 265
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NOME'
      DataSource = dsFuncionario
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 561
    Width = 881
    Height = 87
    Align = alRight
    BiDiMode = bdRightToLeftReadingOnly
    ParentBiDiMode = False
    TabOrder = 1
    VerticalAlignment = taAlignTop
    object btnNovo: TBitBtn
      Left = 30
      Top = 23
      Width = 75
      Height = 25
      Caption = '&Novo'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnGravar: TBitBtn
      Left = 173
      Top = 23
      Width = 75
      Height = 25
      Caption = '&Gravar'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = btnGravarClick
    end
    object btnCancel: TBitBtn
      Left = 317
      Top = 23
      Width = 75
      Height = 25
      Caption = '&Cancel'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = btnCancelClick
    end
    object btnAlterar: TBitBtn
      Left = 454
      Top = 23
      Width = 75
      Height = 25
      Caption = '&Alterar'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 3
      OnClick = btnAlterarClick
    end
    object btnExcluir: TBitBtn
      Left = 614
      Top = 23
      Width = 75
      Height = 25
      Caption = '&Excluir'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 4
      OnClick = btnExcluirClick
    end
    object btnSair: TBitBtn
      Left = 766
      Top = 23
      Width = 75
      Height = 25
      Caption = '&Sair'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 5
      OnClick = btnSairClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 145
    Width = 881
    Height = 416
    Align = alTop
    TabOrder = 2
    VerticalAlignment = taAlignTop
    object dgvFuncionario: TDBGrid
      Left = 1
      Top = 6
      Width = 879
      Height = 409
      Align = alBottom
      BiDiMode = bdLeftToRight
      DataSource = dsFuncionario
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentBiDiMode = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = dgvFuncionarioCellClick
    end
  end
  object DBEdit1: TDBEdit
    Left = 199
    Top = 37
    Width = 265
    Height = 21
    CharCase = ecUpperCase
    DataField = 'CODIGO'
    DataSource = dsFuncionario
    TabOrder = 3
  end
  object dsFuncionario: TDataSource
    DataSet = DM.TBFuncionario
    OnStateChange = dsFuncionarioStateChange
    Left = 40
    Top = 24
  end
  object PopupMenu2: TPopupMenu
    Left = 56
    Top = 80
    object novo: TMenuItem
      Caption = 'novo'
      ShortCut = 113
      OnClick = btnNovoClick
    end
    object Gravar1: TMenuItem
      Caption = 'Gravar'
      ShortCut = 114
      OnClick = btnGravarClick
    end
    object cancelar1: TMenuItem
      Caption = 'Cancelar'
      ShortCut = 115
      OnClick = btnCancelClick
    end
    object Alterar1: TMenuItem
      Caption = 'Alterar'
      ShortCut = 116
      OnClick = btnAlterarClick
    end
    object Excluir1: TMenuItem
      Caption = 'Excluir'
      ShortCut = 117
      OnClick = btnExcluirClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      ShortCut = 121
      OnClick = btnSairClick
    end
  end
end
