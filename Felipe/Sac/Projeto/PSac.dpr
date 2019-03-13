program PSac;

uses
  Forms,
  UPrincipal in '..\Fontes\UPrincipal.pas' {FPrincipal},
  UDM in '..\Fontes\UDM.pas' {DM: TDataModule},
  UCadCliente in '..\Fontes\UCadCliente.pas' {FCad_Cliente},
  UCadFuncionario in '..\Fontes\UCadFuncionario.pas' {FCad_Funcionario};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
