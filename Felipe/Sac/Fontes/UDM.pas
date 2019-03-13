unit UDM;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IBTable;

type
  TDM = class(TDataModule)
    DBSAC: TIBDatabase;
    TRSAC: TIBTransaction;
    TBCliente: TIBTable;
    TBFuncionario: TIBTable;
    TBChamado: TIBTable;
    TBRetorno: TIBTable;
    TBSistema: TIBTable;
    TBStatus: TIBTable;
    TBProblema: TIBTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
