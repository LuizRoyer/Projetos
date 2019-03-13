unit UFornecedor;

interface

uses
   classes, dialogs, UPessoa;

Type
  TFornecedor = class(TPessoa)
    cnpj: string;
    procedure gravar;override;
  end;

implementation

{ TFornecedor }

procedure TFornecedor.gravar;
begin
  inherited;
  SQLQuery.SQL.Clear;
  SQLQuery.SQL.Add('update pessoa set');
  SQLQuery.SQL.Add(' tipo = :tipo, ');
  SQLQuery.SQL.Add(' cnpj = :cnpj');
  SQLQuery.SQL.Add(' where id = :id');

  SQLQuery.ParamByName('tipo').AsString := 'F';
  SQLQuery.ParamByName('cnpj').AsString := self.cnpj;
  SQLQuery.ParamByName('id').AsInteger  := self.PidPes;
  SQLQuery.ExecSQL();
end;

end.
