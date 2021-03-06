unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, Menus, ToolWin, ComCtrls, ExtCtrls, jpeg, TeeFilters, Grids;

type
  TFPrincipal = class(TForm)
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Movimentacoes1: TMenuItem;
    Relatorios1: TMenuItem;
    Sair1: TMenuItem;
    Pessoas1: TMenuItem;
    Clientes1: TMenuItem;
    Funcionarios1: TMenuItem;
    N2: TMenuItem;
    Problemas1: TMenuItem;
    Status1: TMenuItem;
    Sair2: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Panel1: TPanel;
    Panel2: TPanel;
    ImageFiltered1: TImageFiltered;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    StringGrid1: TStringGrid;
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Funcionarios1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);

    // adiciona ucadCliente no implementation  alt+ f11  adiciona
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

uses UCadCliente, UCadFuncionario;

{$R *.dfm}

procedure TFPrincipal.Clientes1Click(Sender: TObject);
begin

  if (Fcad_Cliente = nil) then
    Fcad_Cliente := TfCad_Cliente.Create(nil);

  Fcad_Cliente.ShowModal;
  FreeAndNil(Fcad_Cliente);

end;

procedure TFPrincipal.FormActivate(Sender: TObject);
begin
  StatusBar1.Panels[3].Text := datetostr(date);
end;

procedure TFPrincipal.Funcionarios1Click(Sender: TObject);
begin
  if (FCad_Funcionario = nil) then
    FCad_Funcionario := FCad_Funcionario.Create(nil);

  FCad_Funcionario.ShowModal;
  FreeAndNil(FCad_Funcionario);
end;

procedure TFPrincipal.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFPrincipal.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[4].Text := timetostr(time);
end;

procedure TFPrincipal.ToolButton2Click(Sender: TObject);
begin
if (FCad_Funcionario = nil) then
    FCad_Funcionario := FCad_Funcionario.Create(nil);

  FCad_Funcionario.ShowModal;
  FreeAndNil(FCad_Funcionario);
end;



end.
