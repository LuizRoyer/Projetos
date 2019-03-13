unit URFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, UPessoa, UData, FMTBcd, RpCon, RpConDS,
  RpRave, RpDefine, RpBase, RpSystem, DB, SqlExpr, Provider, DBClient;


type
  TFRFornecedor = class(TForm)
    Panel1: TPanel;
    Label6: TLabel;
    btnPesquisar: TButton;
    txtCnpJCpf: TEdit;
    ListView1: TListView;
    Button1: TButton;
    DSP2: TDataSetProvider;
    rvprjFornecedor: TRvProject;
    rvsysFornecedor: TRvSystem;
    DSP1: TDataSetProvider;
    CDS1: TClientDataSet;
    rvdsFornecedor: TRvDataSetConnection;
    SQL: TSQLQuery;
    procedure Button1Click(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRFornecedor: TFRFornecedor;
   TSQLQuery1: TSQLQuery;
  Pessoa: TPessoa;


implementation

{$R *.dfm}

procedure TFRFornecedor.btnPesquisarClick(Sender: TObject);
begin
 ListView1.Clear;
  Pessoa.pSQLQuery := Data.SQLQuery1;
   TSQLQuery1 :=  Data.SQLQuery1;
  TSQLQuery1 :=  Data.SQLQuery1;
  Pessoa.Pesquisar('F',txtCnpJCpf.Text);
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

procedure TFRFornecedor.Button1Click(Sender: TObject);
begin
rvprjFornecedor.execute;
end;

procedure TFRFornecedor.FormShow(Sender: TObject);
begin
Pessoa := TPessoa.Create;
end;

end.