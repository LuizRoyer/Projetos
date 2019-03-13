unit UMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBXMySQL, FMTBcd, DB, SqlExpr, FVenda, pngimage,
  Buttons, URelatorio;

type
  TMenu = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Image1: TImage;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    tipo: string;
  end;

var
  Menu: TMenu;

implementation

uses FPessoa, FProduto ,FRelatorio;

{$R *.dfm}

procedure TMenu.BitBtn1Click(Sender: TObject);
begin
TRelatorio.Show
end;

procedure TMenu.Button1Click(Sender: TObject);
begin
  FVendas.ShowModal;
end;

procedure TMenu.Button2Click(Sender: TObject);
begin

  FProdutos.ShowModal;
end;

procedure TMenu.Button3Click(Sender: TObject);
begin
      FRelatorios.ShowModal;
end;

procedure TMenu.Button4Click(Sender: TObject);
begin

  tipo := 'C';
  FPessoas.ShowModal;

end;

procedure TMenu.Button5Click(Sender: TObject);
begin

  tipo := 'F';
  FPessoas.ShowModal;
end;

procedure TMenu.Button6Click(Sender: TObject);
var
  H: THandle;
begin
  H := FindWindow(nil, 'Mercado da Esquina');
  if H > 0 then
    SendMessage(H, WM_CLOSE, 0, 0);
end;
end.
