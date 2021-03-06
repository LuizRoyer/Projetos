﻿unit uCad_Sistemas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Grids, DBGrids, Buttons, ExtCtrls, uDm,
  Menus, DB;

type
  TfCad_Sistemas = class(TForm)
    pnl1: TPanel;
    btNovo: TBitBtn;
    btGravar: TBitBtn;
    btCancelar: TBitBtn;
    btAlterar: TBitBtn;
    btExcluir: TBitBtn;
    btSair: TBitBtn;
    pnl2: TPanel;
    pnl3: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    edCODIGO: TDBEdit;
    edIDENTIFICACAO: TDBEdit;
    dsSistemas: TDataSource;
    pm1: TPopupMenu;
    Novo1: TMenuItem;
    Gravar1: TMenuItem;
    Cancelar1: TMenuItem;
    Alterar1: TMenuItem;
    Excluir1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    dgSistema: TDBGrid;
    procedure btSairClick(Sender: TObject);
    procedure dsSistemasStateChange(Sender: TObject);
    procedure dgSistemaCellClick(Column: TColumn);
    procedure btNovoClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCad_Sistemas: TfCad_Sistemas;

implementation

uses uPrincipal;

{$R *.dfm}

procedure TfCad_Sistemas.btAlterarClick(Sender: TObject);
begin
    dm.tbSistema.Edit;
    edIDENTIFICACAO.SetFocus;
end;

procedure TfCad_Sistemas.btCancelarClick(Sender: TObject);
begin
     dm.tbSistema.Cancel;
     dm.tbSistema.First;
end;

procedure TfCad_Sistemas.btExcluirClick(Sender: TObject);
begin
     if (Application.MessageBox('Deseja realmente excluir?', 'Exclusão',
         MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2)=IDYES) then
     begin
       dm.tbSistema.Delete;
       dm.trSac.Commit;
       dm.tbSistema.Active:= true;
     end;
  self.btCancelarClick(sender);
end;

procedure TfCad_Sistemas.btGravarClick(Sender: TObject);
begin
    if (edIDENTIFICACAO.Text = '') then
    begin
       Application.MessageBox('Informe a Identificação!', 'Aviso', MB_OK+MB_ICONWARNING);
       edIDENTIFICACAO.SetFocus;
       exit;
    end;

    with (dm.tbSistema) do
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

procedure TfCad_Sistemas.btNovoClick(Sender: TObject);
var
   prox:integer;
begin
     with (dm.tbSistema) do
     begin
         last;
         prox:= FieldByName('Codigo').AsInteger + 1;
         Append;
         FieldByName('Codigo').AsInteger:= prox;
     end;
     edIDENTIFICACAO.Clear;
     edIDENTIFICACAO.SetFocus;
end;

procedure TfCad_Sistemas.btSairClick(Sender: TObject);
begin
     dm.tbSistema.Cancel;
     close;
end;

procedure TfCad_Sistemas.dgSistemaCellClick(Column: TColumn);
begin
     edIDENTIFICACAO.Text:= dm.tbSistema.FieldByName('Identificacao').AsString;
end;

procedure TfCad_Sistemas.dsSistemasStateChange(Sender: TObject);
begin
     with (dm.tbSistema)do
     begin
          btNovo.Enabled:= dsSistemas.State in [dsBrowse];
          btGravar.Enabled:= dsSistemas.State in [dsEdit,dsInsert];
          btCancelar.Enabled:= dsSistemas.State in [dsInsert, dsEdit];
          btAlterar.Enabled:= (dsSistemas.State in [dsBrowse]) and (RecordCount > 0);
          btExcluir.Enabled:= (dsSistemas.State in [dsBrowse]) and (RecordCount > 0);
     end;
end;

procedure TfCad_Sistemas.FormActivate(Sender: TObject);
begin
     self.dgSistemaCellClick(nil);
end;

end.
