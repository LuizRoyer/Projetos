unit UPessoa;

interface

uses
  classes, dialogs, SqlExpr, sysutils;

Type
  TPessoa = class
  private
    idPes: integer;
    nome: string;
    endereco: string;
    contato: string;
    data_nasc: string;
    cpf: string;
    cnpj: string;
    tipo: string;
  protected
    SQL: TSQLQuery;
  public
    property pIdPes: integer read idPes write idPes;
    property pNome: string read nome write nome;
    property pEndereco: string read endereco write endereco;
    property pContato: string read contato write contato;
    property pData_nasc: string read data_nasc write data_nasc;
    property pCpf: string read cpf write cpf;
    property pCnpj: string read cnpj write cnpj;
    property pTipo: string read tipo write tipo;
    property pSQLQuery: TSQLQuery read SQL write SQL;

    procedure gravar;
    procedure Pesquisar(tipo: string; nome: string);
    procedure Excluir(id: integer);
    procedure Atualizar(id: integer);

  end;

implementation

{ TPessoa }

procedure TPessoa.Atualizar(id: integer);
begin

  SQL.SQL.Clear;
  SQL.SQL.Add('update  Pessoa set  ');
  SQL.SQL.Add('nome= :nome , endereco = :endereco, contato = :contato, ');
  SQL.SQL.Add('dataNasc= :data_nasc, cpf =:cpf, cnpj =:cnpj where idPes =:id');

  SQL.paramByName('nome').AsString := self.nome;
  SQL.paramByName('endereco').AsString := self.endereco;
  SQL.paramByName('contato').AsString := self.contato;
  SQL.paramByName('data_nasc').AsString := self.data_nasc;
  SQL.paramByName('id').AsInteger := id;
  SQL.paramByName('cpf').AsString := self.cpf;
  SQL.paramByName('cnpj').AsString := self.cnpj;
  SQL.ExecSQL;

end;

procedure TPessoa.Excluir(id: integer);
begin

  SQL.SQL.Clear;
  SQL.SQL.Add('delete  from  Pessoa where idPes =:id');
  SQL.paramByName('id').AsInteger := id;
  SQL.ExecSQL;

end;

procedure TPessoa.gravar;
begin
  SQL.SQL.Clear;
  SQL.SQL.Add('insert into pessoa');
  SQL.SQL.Add('(nome, endereco, contato, dataNasc, tipo, cpf, cnpj)');
  SQL.SQL.Add('values');
  SQL.SQL.Add('(:nome, :endereco, :contato, :data_nasc, :tipo, :cpf, :cnpj)');

  SQL.paramByName('nome').AsString := self.nome;
  SQL.paramByName('endereco').AsString := self.endereco;
  SQL.paramByName('contato').AsString := self.contato;
  SQL.paramByName('data_nasc').AsString := self.data_nasc;
  SQL.paramByName('tipo').AsString := self.tipo;
  SQL.paramByName('cpf').AsString := self.cpf;
  SQL.paramByName('cnpj').AsString := self.cnpj;
  SQL.ExecSQL;
end;

procedure TPessoa.Pesquisar(tipo: string; nome: string);
begin
  SQL.Close;
  SQL.SQL.Clear;
  SQL.SQL.Add('Select * from pessoa where tipo =:tipo');
  SQL.paramByName('tipo').AsString := tipo;

  if (nome <> '') then
  begin
    SQL.SQL.Add(' And nome like :nome');
    SQL.paramByName('nome').AsString := '%' + nome + '%';
  end;
  SQL.ExecSQL;
  SQL.open;
end;

end.
