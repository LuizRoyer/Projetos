unit URCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, UPessoa, UData, FMTBcd, RpCon, RpConDS,
  RpRave, RpDefine, RpBase, RpSystem, DB, SqlExpr, Provider, DBClient;

type
  TFRCliente = class(TForm)
    Panel1: TPanel;
    btnPesquisar: TButton;
    Label6: TLabel;
    txtCnpJCpf: TEdit;
    ListView1: TListView;
    Button1: TButton;
    TSQLQuery1: TSQLQuery;
    rvsysPessoa: TRvSystem;
    rvprjPessoa: TRvProject;
    rvdsPessoa: TRvDataSetConnection;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRCliente: TFRCliente;
  TSQLQuery1: TSQLQuery;
  Pessoa: TPessoa;

implementation

{$R *.dfm}

procedure TFRCliente.btnPesquisarClick(Sender: TObject);
begin

  ListView1.Clear;
  //Pessoa.pSQLQuery.FindFirst;
  Pessoa.pSQLQuery := Data.SQLQuery1;
  TSQLQuery1 :=  Data.SQLQuery1;
  Pessoa.Pesquisar('C',txtCnpJCpf.Text);
  Pessoa.pSQLQuery.First;
  while (not Pessoa.pSQLQuery.eof) do
  begin
    with ListView1.Items.Add do
    begin
      Caption := Pessoa.pSQLQuery.FieldByName('idPes').AsString;
      SubItems.Add(Pessoa.pSQLQuery.FieldByName('nome').AsString);
      SubItems.Add(Pessoa.pSQLQuery.FieldByName('endereco').AsString);
      SubItems.Add(Pessoa.pSQLQuery.FieldByName('contato').AsString);
      SubItems.Add(Pessoa.pSQLQuery.FieldByName('dataNasc').AsString);
      SubItems.Add(Pessoa.pSQLQuery.FieldByName('tipo').AsString);
      SubItems.Add(Pessoa.pSQLQuery.FieldByName('cpf').AsString);
      SubItems.Add(Pessoa.pSQLQuery.FieldByName('cnpj').AsString);

    end;
    Pessoa.pSQLQuery.Next;
  end;
end;

procedure TFRCliente.Button1Click(Sender: TObject);
begin
rvprjPessoa.execute;
end;

procedure TFRCliente.FormShow(Sender: TObject);
begin
Pessoa := TPessoa.Create;
end;

end.
