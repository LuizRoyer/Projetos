unit uCad_Cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDm, DB, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, Mask, DBCtrls,
  Menus;

type
  TfCad_Cliente = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dsCliente: TDataSource;
    edCodigo: TDBEdit;
    edNome: TDBEdit;
    edEmail: TDBEdit;
    dgCliente: TDBGrid;
    btNovo: TBitBtn;
    btGravar: TBitBtn;
    btCancelar: TBitBtn;
    btAlterar: TBitBtn;
    btExcluir: TBitBtn;
    btSair: TBitBtn;
    edFone: TMaskEdit;
    pm1: TPopupMenu;
    Novo1: TMenuItem;
    Gravar1: TMenuItem;
    Cancelar1: TMenuItem;
    Alterar1: TMenuItem;
    Excluir1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    procedure btSairClick(Sender: TObject);
    procedure dsClienteStateChange(Sender: TObject);
    procedure dgClienteCellClick(Column: TColumn);
    procedure FormActivate(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCad_Cliente: TfCad_Cliente;

implementation

{$R *.dfm}

procedure TfCad_Cliente.btAlterarClick(Sender: TObject);
begin
     dm.tbCliente.Edit;
     edNome.SetFocus;
end;

procedure TfCad_Cliente.btCancelarClick(Sender: TObject);
begin
     dm.tbCliente.Cancel;
     dm.tbCliente.First;
     edNome.Clear;
     edFone.Clear;
     edEmail.Clear;
end;

procedure TfCad_Cliente.btExcluirClick(Sender: TObject);
begin
   if (Application.MessageBox('Deseja realmente excluir o registro?',
           'Exclus�o',
      MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2)=idYes) then
   begin
        dm.tbCliente.Delete;
        dm.trSac.Commit;
        dm.tbCliente.Active:= true;
   end;
   btCancelarClick(sender);
end;

procedure TfCad_Cliente.btGravarClick(Sender: TObject);
begin
     with (dm.tbCliente) do
     begin
         FieldByName('Fone').AsString:= edFone.Text;
         if (State in [dsEdit, dsInsert]) then
         begin
              post;
              dm.trSac.Commit;
              Active:= true;
         end;
     end;
     self.btCancelarClick(sender);
end;

procedure TfCad_Cliente.btNovoClick(Sender: TObject);
var
   prox:integer;
begin
     with (dm.tbCliente)do
     begin
        last;
        prox:= FieldByName('Codigo').AsInteger+1;
        Append;
        FieldByName('Codigo').AsInteger:= prox;
     end;
     edNome.Clear;
     edFone.Clear;
     edEmail.Clear;
     edNome.SetFocus;
end;

procedure TfCad_Cliente.btSairClick(Sender: TObject);
begin
     dm.tbCliente.Cancel;
     close;
end;

procedure TfCad_Cliente.dgClienteCellClick(Column: TColumn);
begin
     with (dm.tbCliente) do
     begin
        edNome.Text:= FieldByName('Nome').AsString;
        edFone.Text:= FieldByName('Fone').AsString;
        edEmail.Text:= FieldByName('Email').AsString;
     end;
end;

procedure TfCad_Cliente.dsClienteStateChange(Sender: TObject);
begin
     with dm do
     begin
          btNovo.Enabled:= dsCliente.State
                             in [dsBrowse];
          btGravar.Enabled:= dsCliente.State
                         in [dsInsert, dsEdit];
          btCancelar.Enabled:= dsCliente.State
                         in [dsInsert, dsEdit];
          btAlterar.Enabled:= (dsCliente.State
                         in [dsBrowse]) and
                         (tbCliente.RecordCount > 0);
          btExcluir.Enabled:= (dsCliente.State
                          in [dsBrowse]) and
                          (tbCliente.RecordCount>0);
     end;
end;

procedure TfCad_Cliente.FormActivate(Sender: TObject);
begin
     self.dgClienteCellClick(nil);

end;

end.
