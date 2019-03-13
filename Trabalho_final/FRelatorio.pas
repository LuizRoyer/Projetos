unit FRelatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, FMTBcd, DB, SqlExpr, UVendaItem,
  UVenda, DBClient, RpCon, RpConDS, Provider, RpRave, RpDefine, RpBase, RpSystem;

type
  TFRelatorios = class(TForm)
    ListView1: TListView;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelatorios: TFRelatorios;
  SQLQuery1: TSQLQuery;
  vendasItem: TVendaItem;
  venda: TVenda;

implementation

uses FVenda, UData, UMenu;

{$R *.dfm}

procedure TFRelatorios.FormShow(Sender: TObject);
var
  qtd, valor, desconto, acrecimo: double;
begin
  venda := TVenda.Create();
  venda.pSQLQuery := Data.SQLQuery1;

  ListView1.Clear;
  venda.pSQLQuery := Data.SQLQuery1;

  venda.RelatorioVenda('');
  venda.pSQLQuery.First;
  while (not venda.pSQLQuery.eof) do
  begin
    with ListView1.Items.Add do
    begin
      Caption := venda.pSQLQuery.FieldByName('idV').AsString;
      SubItems.Add(venda.pSQLQuery.FieldByName('cliente').AsString);
      SubItems.Add(venda.pSQLQuery.FieldByName('nome').AsString);
      SubItems.Add(venda.pSQLQuery.FieldByName('status').AsString);
      SubItems.Add(venda.pSQLQuery.FieldByName('tipo').AsString);
      SubItems.Add(venda.pSQLQuery.FieldByName('descricao').AsString);

      SubItems.Add(venda.pSQLQuery.FieldByName('valorUnitario')
        .AsString);
      SubItems.Add(venda.pSQLQuery.FieldByName('qtdVenda').AsString);

      qtd := StrToFloat((venda.pSQLQuery.FieldByName('qtdVenda')
        .AsString));
      valor := StrToFloat((venda.pSQLQuery.FieldByName('valorUnitario')
        .AsString));
      desconto := StrToFloat((venda.pSQLQuery.FieldByName('desconto')
        .AsString));
      acrecimo := StrToFloat((venda.pSQLQuery.FieldByName('acrecimo')
        .AsString));

      SubItems.Add(FloatToStr(valor + acrecimo - desconto));
      SubItems.Add(FloatToStr(qtd * (valor + acrecimo - desconto)));
    end;
    venda.pSQLQuery.Next;
  end;
end;
end.
