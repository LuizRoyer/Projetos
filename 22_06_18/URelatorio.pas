unit URelatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, FMTBcd, RpCon, RpConDS, RpRave, RpDefine, RpBase,
  RpSystem, DB, SqlExpr, URCliente, URProdutos, URVenda;

type
  TTRelatorio = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TRelatorio: TTRelatorio;

implementation

uses URFornecedor;

{$R *.dfm}

procedure TTRelatorio.Button1Click(Sender: TObject);
begin
  FRCliente.Show();
end;

procedure TTRelatorio.Button2Click(Sender: TObject);
begin
FRFornecedor.Show();
end;

procedure TTRelatorio.Button3Click(Sender: TObject);
begin
  FRProduto.Show();
end;

procedure TTRelatorio.Button4Click(Sender: TObject);
begin
    FRVenda.Show();
end;

end.
