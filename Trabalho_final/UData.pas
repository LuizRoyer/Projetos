unit UData;

interface

uses
  SysUtils, Classes, DBXMySQL, FMTBcd, DB, SqlExpr, Provider, DBClient;

type
  TData = class(TDataModule)
    SQLQuery1: TSQLQuery;
    SQLConnection1: TSQLConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Data: TData;

implementation

{$R *.dfm}

end.
