unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, ComCtrls, ToolWin, ExtCtrls, Grids;

type
  TfPrincipal = class(TForm)
    imPrincipal: TImageList;
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Movimentaes1: TMenuItem;
    Relatrios1: TMenuItem;
    Sair1: TMenuItem;
    Pessoas1: TMenuItem;
    Clientes1: TMenuItem;
    Funcionrios1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Sair2: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    sgChamado: TStringGrid;
    Sistemas1: TMenuItem;
    Sistemas2: TMenuItem;
    Problemas2: TMenuItem;
    Status2: TMenuItem;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    Chamados1: TMenuItem;
    Retornos1: TMenuItem;
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Sair2Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Sistemas2Click(Sender: TObject);
    procedure Funcionrios1Click(Sender: TObject);
    procedure Status2Click(Sender: TObject);
    procedure Problemas2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;

implementation

uses uCad_Cliente, uCad_Sistemas, uCad_Funcionario, uCad_Status, uCad_Problema;

{$R *.dfm}

procedure TfPrincipal.Clientes1Click(Sender: TObject);
begin
     if (fCad_Cliente = nil) then
       fCad_Cliente:= TfCad_Cliente.Create(nil);

     fCad_Cliente.ShowModal;

     FreeAndNil(fCad_Cliente);
end;

procedure TfPrincipal.FormActivate(Sender: TObject);
begin
    StatusBar1.Panels[2].Text:= datetostr(date);
end;

procedure TfPrincipal.Funcionrios1Click(Sender: TObject);
begin
     if (fCad_Funcionario = nil) then
       fCad_Funcionario:= TfCad_Funcionario.Create(nil);

     fCad_Funcionario.ShowModal;

     FreeAndNil(fCad_Funcionario);
end;

procedure TfPrincipal.Problemas2Click(Sender: TObject);
begin
     if (fCad_Problema = nil) then
       fCad_Problema:= TfCad_Problema.Create(nil);

     fCad_Problema.ShowModal;

     FreeAndNil(fCad_Problema);
end;

procedure TfPrincipal.Sair2Click(Sender: TObject);
begin
     Application.Terminate;
end;

procedure TfPrincipal.Sistemas2Click(Sender: TObject);
begin
     if (fCad_Sistemas = nil) then
       fCad_Sistemas:= TfCad_Sistemas.Create(nil);

     fCad_Sistemas.ShowModal;

     FreeAndNil(fCad_Sistemas);
end;

procedure TfPrincipal.Status2Click(Sender: TObject);
begin
     if (fCad_Status = nil) then
       fCad_Status:= TfCad_Status.Create(nil);

     fCad_Status.ShowModal;

     FreeAndNil(fCad_Status);
end;

procedure TfPrincipal.Timer1Timer(Sender: TObject);
begin
     StatusBar1.Panels[0].Text:=
                   timetostr(time);
end;

end.
