unit UVendaItem;

interface

uses
  classes, dialogs, SqlExpr, sysutils, UPessoa, UProduto, UVenda;

Type
  TVendaItem = class
  private
    idProduto: integer;
    idVenda: integer;
    qtdVenda: integer;
    valorUnitario: double;
    desconto: double;
    acrecimo: double;

  protected
    SQL: TSQLQuery;
  public
    property pidProduto: integer read idProduto write idProduto;
    property pidVenda: integer read idVenda write idVenda;
    property pQtdVenda: integer read qtdVenda write qtdVenda;
    property pValorUnitario: double read valorUnitario write valorUnitario;
    property pDesconto: double read desconto write desconto;
    property pAcrecimo: double read acrecimo write acrecimo;
    property pSQLQuery: TSQLQuery read SQL write SQL;
    procedure gravar;
    procedure excluir(idv: integer; idp: integer);
    procedure alterar(idv: integer; idp: integer);
    procedure pesquisar(idv: integer);
    procedure ExcluirItemVenda(idv: integer; idp: integer);
    function ExisteVedaProduto(idp: integer): integer;
    function ExisteCliente(idv: integer): integer;

  end;

implementation

{ VendaItem }

procedure TVendaItem.alterar(idv, idp: integer);
begin

  SQL.SQL.Clear;
  SQL.SQL.Add('update  itens_vendas set  ');
  SQL.SQL.Add('qtdVenda =:pQtdVenda, valorUnitario =:pValorUnitario,');
  SQL.SQL.Add
    ('desconto =:pDesconto, acrecimo =:pAcrecimo where produto =:idp and venda =:idv');

  SQL.ParamByName('pQtdVenda').AsInteger := self.pQtdVenda;
  SQL.ParamByName('pValorUnitario').AsFloat := self.pValorUnitario;
  SQL.ParamByName('pDesconto').AsFloat := self.pDesconto;
  SQL.ParamByName('pAcrecimo').AsFloat := self.pAcrecimo;
  SQL.ParamByName('idv').AsInteger := idv;
  SQL.ParamByName('idp').AsInteger := idp;

  SQL.ExecSQL;
end;

procedure TVendaItem.excluir(idv: integer; idp: integer);
begin
  SQL.SQL.Clear;
  SQL.SQL.Add('delete  from  itens_vendas where produto =:idp and venda=:idv');
  SQL.ParamByName('idv').AsInteger := idv;
  SQL.ParamByName('idp').AsInteger := idp;
  SQL.ExecSQL;

end;

procedure TVendaItem.ExcluirItemVenda(idv, idp: integer);
begin
  SQL.SQL.Clear;
  SQL.SQL.Add
    ('Delete from  itens_vendas   where venda =:idv  and  produto=:idP');
  SQL.ParamByName('idV').AsInteger := idv;
  SQL.ParamByName('idP').AsInteger := idp;
  SQL.ExecSQL;

end;

procedure TVendaItem.gravar;
begin
  SQL.SQL.Clear;
  SQL.SQL.Add('Insert into Itens_vendas');
  SQL.SQL.Add('(produto , venda, qtdVenda, valorUnitario, desconto,acrecimo)');
  SQL.SQL.Add('values');
  SQL.SQL.Add
    ('(:idProduto , :idVenda, :qtdVenda, :valorUnitario, :desconto,:acrecimo)');

  SQL.ParamByName('idProduto').AsInteger := self.idProduto;
  SQL.ParamByName('idVenda').AsInteger := self.idVenda;
  SQL.ParamByName('qtdVenda').AsInteger := self.qtdVenda;
  SQL.ParamByName('valorUnitario').AsFloat := self.valorUnitario;
  SQL.ParamByName('desconto').AsFloat := self.desconto;
  SQL.ParamByName('acrecimo').AsFloat := self.acrecimo;

  SQL.ExecSQL();

  if SQL.RowsAffected < 1 then
    raise Exception.Create('Erro ao cadastrar Itens_vendas');
end;

procedure TVendaItem.pesquisar(idv: integer);
begin

  SQL.Close;
  SQL.SQL.Clear;
  SQL.SQL.Add('SELECT item.produto , produto.descricao ,item.qtdVenda,');
  SQL.SQL.Add(' item.valorUnitario,item.desconto,item.acrecimo');
  SQL.SQL.Add(' FROM conclusao.itens_vendas item join Produto produto   ');
  SQL.SQL.Add(' on produto.idPrd =item.produto  where  item.venda =:id');
  SQL.ParamByName('id').AsInteger := idv;
  SQL.ExecSQL;
  SQL.open;

end;

function TVendaItem.ExisteVedaProduto(idp: integer): integer;
begin

  SQL.Close;
  SQL.SQL.Clear;
  SQL.SQL.Add('SELECT count(produto) Quantidade FROM itens_vendas');
  SQL.SQL.Add(' where produto =:id');
  SQL.ParamByName('id').AsInteger := idp;
  SQL.ExecSQL;
  SQL.open;

  Result := SQL.FieldByName('Quantidade').AsInteger;
end;

function TVendaItem.ExisteCliente(idv: integer): integer;
begin

  SQL.Close;
  SQL.SQL.Clear;
  SQL.SQL.Add('SELECT count(venda) Quantidade FROM itens_vendas');
  SQL.SQL.Add(' where venda =:id');
  SQL.ParamByName('id').AsInteger := idv;
  SQL.ExecSQL;
  SQL.open;

  Result := SQL.FieldByName('Quantidade').AsInteger;
end;

end.
