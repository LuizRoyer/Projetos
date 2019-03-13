unit uCad_Status;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDm, DB, StdCtrls, Mask, DBCtrls, Grids, DBGrids, Buttons, ExtCtrls,
  Menus;

type
  TfCad_Status = class(TForm)
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
    edDescricao: TDBEdit;
    dsStatus: TDataSource;
    cd: TColorDialog;
    Label1: TLabel;
    edFonte: TDBEdit;
    edFundo: TDBEdit;
    Label2: TLabel;
    sbCorFonte: TSpeedButton;
    sbCorFundo: TSpeedButton;
    pm1: TPopupMenu;
    Novo1: TMenuItem;
    Gravar1: TMenuItem;
    Cancelar1: TMenuItem;
    Alterar1: TMenuItem;
    Excluir1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    dgStatus: TDBGrid;
    procedure sbCorFundoClick(Sender: TObject);
    procedure sbCorFonteClick(Sender: TObject);
    procedure dsStatusStateChange(Sender: TObject);
    procedure dgStatusCellClick(Column: TColumn);
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
  fCad_Status: TfCad_Status;

implementation

uses uPrincipal;



{$R *.dfm}

procedure TfCad_Status.btAlterarClick(Sender: TObject);
begin
     dm.tbStatus.Edit;
     edDescricao.SetFocus;
end;

procedure TfCad_Status.btCancelarClick(Sender: TObject);
begin
     dm.tbStatus.Cancel;
     dm.tbStatus.First;
end;

procedure TfCad_Status.btExcluirClick(Sender: TObject);
begin
     if (Application.MessageBox('Deseja realmente excluir?', 'Exclusão',
         MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2)=IDYES) then
     begin
       dm.tbStatus.Delete;
       dm.trSac.Commit;
       dm.tbSistema.Active:= true;
     end;
  self.btCancelarClick(sender);
end;

procedure TfCad_Status.btGravarClick(Sender: TObject);
begin
     if (edDescricao.Text = '') then
    begin
       Application.MessageBox('Informe a Descrição!', 'Aviso', MB_OK+MB_ICONWARNING);
       edDescricao.SetFocus;
       exit;
    end;
    if (edFonte.Text = '') then
    begin
         Application.MessageBox('Informe a Cor da Fonte!', 'Aviso', MB_OK+MB_ICONWARNING);
         edFonte.SetFocus;
         exit;
    end;
    if (edFundo.Text = '') then
    begin
         Application.MessageBox('Informe a Cor de Fundo!', 'Aviso', MB_OK+MB_ICONWARNING);
         edFundo.SetFocus;
         exit;
    end;
    with (dm.tbStatus) do
    begin
      if (State in [dsInsert, dsEdit]) then
      begin
           FieldByName('Tipo').asString:= 'P';
           post;
           dm.trSac.Commit;
           Active:= true;
      end;
    end;
    self.btCancelarClick(sender);

end;

procedure TfCad_Status.btNovoClick(Sender: TObject);
var
   prox:integer;
begin
      with (dm.tbStatus) do
      begin
          last;
          prox:= FieldByName('Codigo').asInteger+1;
          append;
          FieldByName('Codigo').asInteger:= prox;
      end;
      edDescricao.Clear;
      edFonte.Clear;
      edFundo.Clear;
      edDescricao.SetFocus;
end;

procedure TfCad_Status.btSairClick(Sender: TObject);
begin
     dm.tbStatus.Cancel;
     close;
end;

procedure TfCad_Status.dgStatusCellClick(Column: TColumn);
begin
      with (dm.tbStatus) do
      begin
          edDescricao.Text:= FieldByName('descricao').asString;
          edFonte.Text:= FieldByName('CorFonte').asString;
          edFundo.Text:= FieldByName('CorFundo').asString;
          edFonte.Font.Color:= StringToColor(edFonte.Text);
          edFundo.Font.Color:= StringToColor(edFonte.Text);
          edFonte.Color:= StringToColor(edFundo.Text);
          edFundo.Color:= StringToColor(edFundo.Text);
      end;
end;

procedure TfCad_Status.dsStatusStateChange(Sender: TObject);
begin
     with (dm.tbStatus)do
     begin
          btNovo.Enabled:= dsStatus.State in [dsBrowse];
          btGravar.Enabled:= dsStatus.State in [dsEdit,dsInsert];
          btCancelar.Enabled:= dsStatus.State in [dsInsert, dsEdit];
          btAlterar.Enabled:= (dsStatus.State in [dsBrowse]) and (RecordCount > 0);
          btExcluir.Enabled:= (dsStatus.State in [dsBrowse]) and (RecordCount > 0);
     end;
end;

procedure TfCad_Status.FormActivate(Sender: TObject);
begin
     self.dgStatusCellClick(nil);
end;

procedure TfCad_Status.sbCorFonteClick(Sender: TObject);
begin
    if cd.Execute(Self.Handle) then
       begin
            edFonte.Text := ColorToString(cd.Color);
            edFonte.Font.Color:= cd.Color;
            edFundo.Font.Color:= cd.Color;
       end;
end;

procedure TfCad_Status.sbCorFundoClick(Sender: TObject);
begin
     if cd.Execute(Self.Handle) then
       begin
            edFundo.Text := ColorToString(cd.Color);
            edFonte.Color:= cd.Color;
            edFundo.Color:= cd.Color;
       end;
end;

end.
