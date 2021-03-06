unit URProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UProduto, FMTBcd, Provider, DBClient, DB, SqlExpr, RpCon, RpConDS,
  RpRave, RpDefine, RpBase, RpSystem, ExtCtrls, StdCtrls, ComCtrls, UData;

type
  TFRProduto = class(TForm)
    ListView1: TListView;
    btnPesquisar: TButton;
    Label6: TLabel;
    txtCnpJCpf: TEdit;
    Button1: TButton;
    Panel1: TPanel;
    rvsysProduto: TRvSystem;
    rvprjProduto: TRvProject;
    rvdsProduto: TRvDataSetConnection;
    SQL2: TSQLQuery;
    CDS2: TClientDataSet;
    DSP2: TDataSetProvider;
    procedure btnPesquisarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRProduto: TFRProduto;
  TSQLQuery1: TSQLQuery;
  Produto: TProduto;

implementation

{$R *.dfm}

procedure TFRProduto.btnPesquisarClick(Sender: TObject);
begin
  ListView1.Clear;
  Produto.pSQLQuery := Data.SQLQuery1;
  TSQLQuery1 := Data.SQLQuery1;
  Produto.Pesquisar(txtCnpJCpf.Text);
  Produto.pSQLQuery.First;
  while (not Produto.pSQLQuery.eof) do
  begin
    with ListView1.Items.Add do
    begin
      Caption := Produto.pSQLQuery.FieldByName('idPrd').AsString;
      SubItems.Add(Produto.pSQLQuery.FieldByName('descricao').AsString);
      SubItems.Add(Produto.pSQLQuery.FieldByName('unidade').AsString);
      SubItems.Add(Produto.pSQLQuery.FieldByName('valor').AsString);
      SubItems.Add(Produto.pSQLQuery.FieldByName('qtdEstoque').AsString);
    end;
    Produto.pSQLQuery.Next;
  end;
end;

procedure TFRProduto.Button1Click(Sender: TObject);
begin
  rvprjProduto.Execute;
end;

procedure TFRProduto.FormShow(Sender: TObject);
begin
  Produto := TProduto.Create;
end;

end.
