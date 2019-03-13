unit uCad_Problema;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, Grids, DBGrids, uDm,
  Menus, DB;

type
  TfCad_Problema = class(TForm)
    pnl3: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    edCODIGO: TDBEdit;
    edDescricao: TDBEdit;
    pnl2: TPanel;
    pnl1: TPanel;
    btNovo: TBitBtn;
    btGravar: TBitBtn;
    btCancelar: TBitBtn;
    btAlterar: TBitBtn;
    btExcluir: TBitBtn;
    btSair: TBitBtn;
    dsProblema: TDataSource;
    pm1: TPopupMenu;
    Novo1: TMenuItem;
    Gravar1: TMenuItem;
    Cancelar1: TMenuItem;
    Alterar1: TMenuItem;
    Excluir1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    dgProblema: TDBGrid;
    procedure dsProblemaStateChange(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dgProblemaCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCad_Problema: TfCad_Problema;

implementation

uses uPrincipal;

{$R *.dfm}

procedure TfCad_Problema.btAlterarClick(Sender: TObject);
begin
     dm.tbProblema.Edit;
     edDescricao.SetFocus;
end;

procedure TfCad_Problema.btCancelarClick(Sender: TObject);
begin
     dm.tbProblema.Cancel;
     dm.tbProblema.First;
end;

procedure TfCad_Problema.btExcluirClick(Sender: TObject);
begin
     if (Application.MessageBox('Deseja realmente excluir?', 'Exclusão',
         MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2)=IDYES) then
     begin
       dm.tbProblema.Delete;
       dm.trSac.Commit;
       dm.tbProblema.Active:= true;
     end;
  self.btCancelarClick(sender);

end;

procedure TfCad_Problema.btGravarClick(Sender: TObject);
begin
    if (edDescricao.Text = '') then
    begin
       Application.MessageBox('Informe a Identificação!', 'Aviso', MB_OK+MB_ICONWARNING);
       edDescricao.SetFocus;
       exit;
    end;

    with (dm.tbProblema) do
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

procedure TfCad_Problema.btNovoClick(Sender: TObject);
var
   prox:integer;
begin
     with (dm.tbProblema) do
     begin
         last;
         prox:= FieldByName('Codigo').AsInteger + 1;
         Append;
         FieldByName('Codigo').AsInteger:= prox;
     end;
     edDescricao.Clear;
     edDescricao.SetFocus;
end;

procedure TfCad_Problema.btSairClick(Sender: TObject);
begin
     dm.tbProblema.Cancel;
     close;
end;

procedure TfCad_Problema.dgProblemaCellClick(Column: TColumn);
begin
     edDescricao.Text:= dm.tbProblema.FieldByName('Descricao').AsString;
end;

procedure TfCad_Problema.dsProblemaStateChange(Sender: TObject);
begin
    with (dm.tbProblema)do
     begin
          btNovo.Enabled:= dsProblema.State in [dsBrowse];
          btGravar.Enabled:= dsProblema.State in [dsEdit,dsInsert];
          btCancelar.Enabled:= dsProblema.State in [dsInsert, dsEdit];
          btAlterar.Enabled:= (dsProblema.State in [dsBrowse]) and (RecordCount > 0);
          btExcluir.Enabled:= (dsProblema.State in [dsBrowse]) and (RecordCount > 0);
     end;
end;

procedure TfCad_Problema.FormActivate(Sender: TObject);
begin
     self.dgProblemaCellClick(nil);
end;

end.
