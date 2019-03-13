unit uDm;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IBTable;

type
  Tdm = class(TDataModule)
    dbSac: TIBDatabase;
    trSac: TIBTransaction;
    tbCliente: TIBTable;
    tbFuncionario: TIBTable;
    tbChamado: TIBTable;
    tbProblema: TIBTable;
    tbRetorno: TIBTable;
    tbSistema: TIBTable;
    tbStatus: TIBTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

end.
