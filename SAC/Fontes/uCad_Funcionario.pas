unit uCad_Funcionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Mask, DBCtrls, DB, ExtCtrls, uDm, Buttons,
  uPrincipal, Menus;

type
  TfCad_Funcionario = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    dsFuncionario: TDataSource;
    edCodigo: TDBEdit;
    edNome: TDBEdit;
    btNovo: TBitBtn;
    btGravar: TBitBtn;
    btCancelar: TBitBtn;
    btAlterar: TBitBtn;
    btExcluir: TBitBtn;
    btSair: TBitBtn;
    PopupMenu1: TPopupMenu;
    Novo1: TMenuItem;
    Gravar1: TMenuItem;
    Cancelar1: TMenuItem;
    Alterar1: TMenuItem;
    Excluir1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    dgFuncionario: TDBGrid;
    procedure dsFuncionarioStateChange(Sender: TObject);
    procedure dgFuncionarioCellClick(Column: TColumn);
    procedure btSairClick(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCad_Funcionario: TfCad_Funcionario;

implementation

{$R *.dfm}

procedure TfCad_Funcionario.btAlterarClick(Sender: TObject);
begin
    dm.tbFuncionario.Edit;
    edNome.SetFocus;
end;

procedure TfCad_Funcionario.btCancelarClick(Sender: TObject);
begin
     dm.tbFuncionario.Cancel;
     dm.tbFuncionario.First;
end;

procedure TfCad_Funcionario.btExcluirClick(Sender: TObject);
begin
  if (Application.MessageBox('Deseja realmente excluir?',
                             'Exclus�o',
          MB_YESNO+MB_ICONQUESTION+
          MB_DEFBUTTON2)=IDYES) then
  begin
       dm.tbFuncionario.Delete;
       dm.trSac.Commit;
       dm.tbFuncionario.Active:= true;
  end;
  self.btCancelarClick(sender);
end;

procedure TfCad_Funcionario.btGravarClick(Sender: TObject);
begin
  if (edNome.Text = '') then
  begin
    Application.MessageBox('Informe o nome!',
                           'Aviso',
                       MB_OK+MB_ICONWARNING);
   edNome.SetFocus;
   exit;
  end;

  with (dm.tbFuncionario) do
  begin
      if (State in [dsInsert, dsEdit]) then
      begin
           post;
           dm.trSac.Commit;
           Active:= true;
      end;
  end;
  self.btCancelarClick(sender);
end;

procedure TfCad_Funcionario.btNovoClick(Sender: TObject);
var
   prox:integer;
begin
     with (dm.tbFuncionario) do
     begin
         last;
         prox:= FieldByName('Codigo').AsInteger + 1;
         Append;
         FieldByName('Codigo').AsInteger:= prox;
     end;
     edNome.Clear;
     edNome.SetFocus;
end;

procedure TfCad_Funcionario.btSairClick(Sender: TObject);
begin
     dm.tbFuncionario.Cancel;
     close;
end;

procedure TfCad_Funcionario.dgFuncionarioCellClick(Column: TColumn);
begin
     edNome.Text:= dm.tbFuncionario.
                   FieldByName('Nome').AsString;
end;

procedure TfCad_Funcionario.dsFuncionarioStateChange(Sender: TObject);
begin
     with (dm.tbFuncionario)do
     begin
          btNovo.Enabled:= dsFuncionario.State
                           in [dsBrowse];
          btGravar.Enabled:= dsFuncionario.State
                             in [dsEdit,dsInsert];
          btCancelar.Enabled:= dsFuncionario.State
                               in [dsInsert, dsEdit];
          btAlterar.Enabled:= (dsFuncionario.State
                               in [dsBrowse])and
                               (RecordCount > 0);
          btExcluir.Enabled:= (dsFuncionario.State
                                in [dsBrowse])and
                              (RecordCount>0);
     end;
end;

procedure TfCad_Funcionario.FormActivate(Sender: TObject);
begin
    self.dgFuncionarioCellClick(nil);
end;

end.
