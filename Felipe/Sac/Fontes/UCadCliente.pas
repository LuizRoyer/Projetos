unit UCadCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDM, StdCtrls, Buttons, Grids, DBGrids, Mask, DBCtrls, DB, ExtCtrls,
  UPrincipal, Menus;
/// adicionar alt + f11  adiciona udm

type
  TFCad_Cliente = class(TForm)
    aaa: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel2: TPanel;
    DSCliente: TDataSource;
    edCodigo: TDBEdit;
    edNome: TDBEdit;
    edemail: TDBEdit;
    dgvCliente: TDBGrid;
    btnNovo: TBitBtn;
    btnGravar: TBitBtn;
    btnCancel: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    btnSair: TBitBtn;
    edFone: TMaskEdit;
    PopupMenu1: TPopupMenu;
    novo: TMenuItem;
    Gravar1: TMenuItem;
    cancelar1: TMenuItem;
    Alterar1: TMenuItem;
    Excluir1: TMenuItem;
    Sair1: TMenuItem;
    N1: TMenuItem;
    procedure btnSairClick(Sender: TObject);
    procedure DSClienteStateChange(Sender: TObject);
    procedure dgvClienteCellClick(Column: TColumn);
    procedure FormActivate(Sender: TObject);
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
  FCad_Cliente: TFCad_Cliente;

implementation

{$R *.dfm}

procedure TFCad_Cliente.btnAlterarClick(Sender: TObject);
begin
  dm.TBCliente.Edit;
  edNome.SetFocus;

end;

procedure TFCad_Cliente.btnCancelClick(Sender: TObject);
begin
  dm.TBCliente.Cancel;
  dm.TBCliente.First;
  edNome.Clear;
  edFone.Clear;
  edemail.Clear;
end;

procedure TFCad_Cliente.btnExcluirClick(Sender: TObject);
begin
  if (Application.MessageBox('Deseja Realmente Excluir o registro', 'Excluir',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idYES) then
  begin
    dm.TBCliente.Delete;
    dm.TRSAC.Commit;
   dm.TBCliente.Active := true;

  end;
      btnCancelclick(sender);
end;

procedure TFCad_Cliente.btnGravarClick(Sender: TObject);
begin
  with (dm.TBCliente) do
  begin
    FieldByName('Fone').AsString := edFone.Text;

    if (State in [dsEdit, dsInsert]) then
    begin
      post;
      dm.TRSAC.Commit;
      Active := true;

    end;
  end;
  self.btnCancelClick(Sender);
end;

procedure TFCad_Cliente.btnNovoClick(Sender: TObject);
var
  prox: integer;
begin
  with (dm.TBCliente) do
  begin

    last;
    prox := FieldByName('Codigo').AsInteger + 1;
    append;
    FieldByName('Codigo').AsInteger := prox;

  end;
  edNome.Clear;
  edFone.Clear;
  edemail.Clear;
  edNome.SetFocus;
end;

procedure TFCad_Cliente.btnSairClick(Sender: TObject);
begin

  dm.TBCliente.Cancel;
  close;

end;

procedure TFCad_Cliente.dgvClienteCellClick(Column: TColumn);
begin
  with (dm.TBCliente) do
  begin

    edNome.Text := FieldByName('Nome').AsString;
    edFone.Text := FieldByName('Fone').AsString;
    edemail.Text := FieldByName('Email').AsString;

  end;
end;

procedure TFCad_Cliente.DSClienteStateChange(Sender: TObject);
begin
  with dm do
  begin

    btnNovo.Enabled := DSCliente.State in ([dsBrowse]);
    btnGravar.Enabled := DSCliente.State in ([dsInsert, dsEdit]);
    btnCancel.Enabled := DSCliente.State in ([dsInsert, dsEdit]);
    btnAlterar.Enabled := DSCliente.State in [dsBrowse]
      in ([TBCliente.RecordCount > 0]);
    btnExcluir.Enabled := DSCliente.State in ([dsBrowse])
      in ([TBCliente.RecordCount > 0]);

  end;
end;

procedure TFCad_Cliente.FormActivate(Sender: TObject);
begin
  self.dgvClienteCellClick(nil);
end;

end.
