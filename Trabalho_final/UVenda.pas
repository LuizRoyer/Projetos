unit UVenda;

interface

uses
  classes, dialogs, SqlExpr, sysutils, UPessoa;

Type
  TVenda = class
  private
    idV: integer;
    idCliente: integer;
    data: string;
    status: string;
    tipo: string;

  protected
    SQLQuery: TSQLQuery;
  public
    property pIdV: integer read idV write idV;
    property pidCliente: integer read idCliente write idCliente;
    property pData: string read data write data;
    property pStatus: string read status write status;
    property pTipo: string read tipo write tipo;
    property pSQLQuery: TSQLQuery read SQLQuery write SQLQuery;

    procedure gravar;
    procedure PesquisarVenda(id: integer);
    procedure ExcluirVenda(id: integer);
    procedure PegarIndice();
    procedure ExcluirItemVenda(id: integer);
    procedure FinalizarCompra(id: integer);
    procedure RelatorioVenda(idV: String; dtIni: Tdate; dtfim: Tdate); overload;
    procedure RelatorioVenda(idV: String); overload;

  end;

implementation

{ TVenda }

procedure TVenda.ExcluirItemVenda(id: integer);
begin
  SQLQuery.SQL.Clear;
  SQLQuery.SQL.Add(' delete  from  itens_vendas where  venda=:id');
  SQLQuery.ParamByName('id').AsInteger := id;
  SQLQuery.ExecSQL;

end;

procedure TVenda.ExcluirVenda(id: integer);
begin

  SQLQuery.SQL.Clear;
  SQLQuery.SQL.Add('Delete from  venda   where idV=:id');
  SQLQuery.ParamByName('id').AsInteger := id;
  SQLQuery.ExecSQL;
end;

procedure TVenda.FinalizarCompra(id: integer);
begin
  SQLQuery.SQL.Clear;
  SQLQuery.SQL.Add('update  venda set  ');
  SQLQuery.SQL.Add(' status =:status  where idV =:id');
  SQLQuery.ParamByName('id').AsInteger := id;
  SQLQuery.ParamByName('status').AsString := 'Finalizado';
  SQLQuery.ExecSQL;

end;

procedure TVenda.gravar;
begin
  SQLQuery.SQL.Clear;
  SQLQuery.SQL.Add('Insert into Venda');
  SQLQuery.SQL.Add('(data, cliente, status, tipo)');
  SQLQuery.SQL.Add('values');
  SQLQuery.SQL.Add('(:data, :idCliente, :status, :tipo)');

  SQLQuery.ParamByName('data').AsString := self.data;
  SQLQuery.ParamByName('idCliente').AsInteger := self.idCliente;
  SQLQuery.ParamByName('status').AsString := self.status;
  SQLQuery.ParamByName('tipo').AsString := self.tipo;

  SQLQuery.ExecSQL();
end;

procedure TVenda.PegarIndice;
begin
  SQLQuery.Close;
  SQLQuery.SQL.Clear;
  SQLQuery.SQL.Add('Select Max(idv)idv from Venda');
  SQLQuery.open;

  self.idV := SQLQuery.FieldByName('idv').AsInteger;
end;

procedure TVenda.PesquisarVenda(id: integer);
begin

  SQLQuery.Close;
  SQLQuery.SQL.Clear;
  SQLQuery.SQL.Add
    ('SELECT venda.*,  pessoa.* FROM conclusao.venda venda JOIN Pessoa pessoa');
  SQLQuery.SQL.Add('  on pessoa.idPes = venda.cliente where idV=:id');
  SQLQuery.ParamByName('id').AsInteger := id;

  SQLQuery.ExecSQL;
  SQLQuery.open;

end;

procedure TVenda.RelatorioVenda(idV: String);
begin
  SQLQuery.Close;
  SQLQuery.SQL.Clear;
  SQLQuery.SQL.Add
    ('select  v.idV , v.cliente , c.nome ,v.data , v.status ,c.tipo ,');
  SQLQuery.SQL.Add
    ('p.descricao , i.acrecimo, i.desconto ,i.valorUnitario ,i.qtdVenda ,');
  SQLQuery.SQL.Add
    ('((i.acrecimo +i.valorUnitario -i.desconto)* i.qtdVenda) as ValorFinal');
  SQLQuery.SQL.Add(' from  conclusao.venda v');
  SQLQuery.SQL.Add(' join conclusao.pessoa c on c.idPes = v.cliente');
  SQLQuery.SQL.Add(' join conclusao.itens_vendas i on i.venda = v.idV');
  SQLQuery.SQL.Add(' join conclusao.produto as p on p.idPrd = i.produto');
  if (idV <> '') then
  begin
    SQLQuery.SQL.Add(' where v.idV =:id');
    SQLQuery.ParamByName('id').AsInteger := StrtoInt(idV);
  end;
  SQLQuery.open;
end;

procedure TVenda.RelatorioVenda(idV: String; dtIni: Tdate; dtfim: Tdate);
begin

  SQLQuery.Close;
  SQLQuery.SQL.Clear;
  SQLQuery.SQL.Add
    ('select  v.idV , v.cliente , c.nome ,v.data , v.status ,c.tipo ,');
  SQLQuery.SQL.Add
    ('p.descricao , i.acrecimo, i.desconto ,i.valorUnitario ,i.qtdVenda ,');
  SQLQuery.SQL.Add
    ('((i.acrecimo +i.valorUnitario -i.desconto)* i.qtdVenda) as ValorFinal');
  SQLQuery.SQL.Add(' from  conclusao.venda v');
  SQLQuery.SQL.Add(' join conclusao.pessoa c on c.idPes = v.cliente');
  SQLQuery.SQL.Add(' join conclusao.itens_vendas i on i.venda = v.idV');
  SQLQuery.SQL.Add(' join conclusao.produto as p on p.idPrd = i.produto');
  if (idV <> '') then
  begin
    if (idV <> '0') then
    begin
      SQLQuery.SQL.Add(' where v.idV =:id');
      SQLQuery.ParamByName('id').AsInteger := StrtoInt(idV);
    end;
  end
  else
  begin
    if (dateToStr(dtIni) <> '') then
    begin
      SQLQuery.SQL.Add('and v.data between :data and :dtfi');
      SQLQuery.ParamByName('data').value := FormatDateTime('dd/MM/yyyy', dtIni);
      SQLQuery.ParamByName('dtfi').value := FormatDateTime('dd/MM/yyyy', dtfim);
    end;
  end;
  SQLQuery.open;
end;

end.
