program pSAC;

uses
  Forms,
  uCad_Cliente in '..\Fontes\uCad_Cliente.pas' {fCad_Cliente},
  uCad_Funcionario in '..\Fontes\uCad_Funcionario.pas' {fCad_Funcionario},
  uCad_Problema in '..\Fontes\uCad_Problema.pas' {fCad_Problema},
  uCad_Sistemas in '..\Fontes\uCad_Sistemas.pas' {fCad_Sistemas},
  uDm in '..\Fontes\uDm.pas' {dm: TDataModule},
  uPrincipal in '..\Fontes\uPrincipal.pas' {fPrincipal},
  uCad_Status in '..\Fontes\uCad_Status.pas' {fCad_Status};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.Run;
end.
