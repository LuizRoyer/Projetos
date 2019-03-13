unit UProduto;

interface

uses
  classes, dialogs, SqlExpr, sysutils, UPessoa;

Type
  TProduto = class
  private
    idPrd: integer;
    descricao: String;
    unidade: string;
    valor: double;
    qtdEstoque: double;

  protected
    SQL: TSQLQuery;
  public
    property pIdPrd: integer read idPrd write idPrd;
    property PDescricao: string read descricao write descricao;
    property pUnidade: string read unidade write unidade;
    property pValor: double read valor write valor;
    property pQtdEstoque: double read qtdEstoque write qtdEstoque;
    property pSQLQuery: TSQLQuery read SQL write SQL;

    procedure gravar;
    procedure excluir(id: integer);
    procedure atualizar(id: integer);
    procedure pesquisar(nome: String);
    procedure PegarEstoque(id: integer);

  end;

implementation

procedure TProduto.atualizar(id: integer);
begin
  SQL.SQL.Clear;
  SQL.SQL.Add('update  Produto set  ');
  SQL.SQL.Add('descricao =:descricao , unidade =:unidade,');
  SQL.SQL.Add('qtdEstoque =:qtdEstoque, valor =:valor where idPrd =:id');

  SQL.ParamByName('descricao').AsString := self.descricao;
  SQL.ParamByName('unidade').AsString := self.unidade;
  SQL.ParamByName('valor').AsFloat := self.valor;
  SQL.ParamByName('qtdEstoque').AsFloat := self.qtdEstoque;
  SQL.ParamByName('id').AsInteger := id;

  SQL.ExecSQL;
end;

procedure TProduto.excluir(id: integer);
begin
  SQL.SQL.Clear;
  SQL.SQL.Add('delete  from  Produto where idPrd =:id');
  SQL.ParamByName('id').AsInteger := id;
  SQL.ExecSQL;
end;

procedure TProduto.gravar;
begin
  SQL.SQL.Clear;
  SQL.SQL.Add('Insert into Produto');
  SQL.SQL.Add('(idPrd , descricao, unidade, valor, qtdEstoque)');
  SQL.SQL.Add('values');
  SQL.SQL.Add('(:idPrd , :descricao, :unidade, :valor, :qtdEstoque)');

  SQL.ParamByName('idPrd').AsInteger := self.idPrd;
  SQL.ParamByName('descricao').AsString := self.descricao;
  SQL.ParamByName('unidade').AsString := self.unidade;
  SQL.ParamByName('valor').AsFloat := self.valor;
  SQL.ParamByName('qtdEstoque').AsFloat := self.qtdEstoque;

  SQL.ExecSQL;
end;

procedure TProduto.PegarEstoque(id: integer);
begin
  SQL.Close;
  SQL.SQL.Clear;
  SQL.SQL.Add('select qtdEstoque from produto  ');
  SQL.SQL.Add(' where idPrd =:id');
  SQL.ParamByName('id').AsInteger := id;
  SQL.open;

  self.qtdEstoque := SQL.FieldByName('qtdEstoque').AsInteger;

end;

procedure TProduto.pesquisar(nome: string);
begin
  SQL.Close;
  SQL.SQL.Clear;
  SQL.SQL.Add('Select *  from Produto');
  if (nome <> '') then
  begin
    SQL.SQL.Add(' where descricao like :nome');
    SQL.ParamByName('nome').AsString := '%' + nome + '%';
  end;
  SQL.ExecSQL;
  SQL.open;
end;

end.
