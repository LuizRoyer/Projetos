unit UCliente;

interface

uses
  classes, dialogs, UPessoa;

Type
  TCliente = class(TPessoa)
    cpf: string;
    procedure gravar; override;
  end;

implementation

{ TCliente }

procedure TCliente.gravar;
begin
  inherited;
  SQLQuery.SQL.Clear;
  SQLQuery.SQL.Add('update pessoa set');
  SQLQuery.SQL.Add(' tipo = :tipo, ');
  SQLQuery.SQL.Add(' cpf = :cpf');
  SQLQuery.SQL.Add(' where idPes = :idPes');

  SQLQuery.ParamByName('tipo').AsString := 'C';
  SQLQuery.ParamByName('cpf').AsString := self.cpf;
  SQLQuery.ParamByName('idPes').AsInteger := self.PidPes;
  SQLQuery.ExecSQL();
end;

end.
