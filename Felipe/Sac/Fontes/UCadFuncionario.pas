unit UCadFuncionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDM, Grids, DBGrids, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompEdit, IWDBStdCtrls, DB, StdCtrls,
  ExtCtrls,
  Buttons, Mask, DBCtrls, UPrincipal, Menus;

type
  TFCad_Funcionario = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    dsFuncionario: TDataSource;
    dgvFuncionario: TDBGrid;
    btnNovo: TBitBtn;
    btnGravar: TBitBtn;
    btnCancel: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    btnSair: TBitBtn;
    edNome: TDBEdit;
    DBEdit1: TDBEdit;
    PopupMenu2: TPopupMenu;
    novo: TMenuItem;
    Gravar1: TMenuItem;
    cancelar1: TMenuItem;
    Alterar1: TMenuItem;
    Excluir1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    procedure dsFuncionarioStateChange(Sender: TObject);
    procedure dgvFuncionarioCellClick(Column: TColumn);
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCad_Funcionario: TFCad_Funcionario;

implementation

{$R *.dfm}

procedure TFCad_Funcionario.btnAlterarClick(Sender: TObject);
begin
  dm.TBFuncionario.Edit;
  edNome.SetFocus;

end;

procedure TFCad_Funcionario.btnCancelClick(Sender: TObject);
begin

  dm.TBFuncionario.Cancel;
  edNome.Clear;
  dm.TBFuncionario.First; // Joga o foco p�ra o 1 registro;

end;

procedure TFCad_Funcionario.btnExcluirClick(Sender: TObject);
begin
  if (Application.MessageBox('Tem certeza que quer excluir', 'Aviso',
    MB_YESNO + MB_ICONQUESTION) = IDYES) then
  begin
    dm.TBFuncionario.Delete;
    dm.TRSAC.Commit;
    dm.TBFuncionario.Active := true;

  end;
  self.btnCancelClick(Sender);
end;

procedure TFCad_Funcionario.btnGravarClick(Sender: TObject);
begin
  if (edNome.Text = '') then
  begin
 // Application.MessageBox('Informe o nome', 'Aviso', mbOK + MB_ICONWARNING);
    edNome.SetFocus;
    exit;
  end
  else
  begin

    with (dm.TBFuncionario) do
    begin

      if (State in [dsInsert, dsEdit]) then
        post;
      dm.TRSAC.Commit;
      Active := true;

    end;
  end;
  self.btnCancelClick(Sender);
end;

procedure TFCad_Funcionario.btnNovoClick(Sender: TObject);
var
  prox: integer;
begin
  with (dm.TBFuncionario) do
  begin

    last; // vai para a ultima linha da tabela
    prox := FieldByName('Codigo').AsInteger + 1;
    append;
    FieldByName('Codigo').AsInteger := prox;

  end;
  edNome.Clear;
  edNome.SetFocus;

end;

procedure TFCad_Funcionario.btnSairClick(Sender: TObject);
begin

  dm.TBFuncionario.Cancel;
  close;

end;

procedure TFCad_Funcionario.dgvFuncionarioCellClick(Column: TColumn);
begin

  edNome.Text := dm.TBFuncionario.FieldByName('Nome').AsString;

end;

procedure TFCad_Funcionario.dsFuncionarioStateChange(Sender: TObject);
begin
  with (dm.TBFuncionario) do
  begin
    // Metodo para habilitar os botoes
    btnNovo.Enabled := dsFuncionario.State in [dsBrowse];
    btnGravar.Enabled := dsFuncionario.State in [dsEdit, dsInsert];
    btnCancel.Enabled := dsFuncionario.State in [dsEdit, dsInsert];
    btnAlterar.Enabled := (dsFuncionario.State in [dsBrowse]
      in [RecordCount > 0]);
    btnExcluir.Enabled := (dsFuncionario.State in [dsBrowse]
      in [RecordCount > 0]);

  end;
end;

end.
