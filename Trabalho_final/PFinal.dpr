program PFinal;

uses
  Forms,
  UMenu in 'UMenu.pas' {Menu},
  UPessoa in 'UPessoa.pas',
  UVenda in 'UVenda.pas',
  UProduto in 'UProduto.pas',
  UVendaItem in 'UVendaItem.pas',
  FPessoa in 'FPessoa.pas' {FPessoas},
  FProduto in 'FProduto.pas' {FProdutos},
  FVenda in 'FVenda.pas' {FVendas},
  UData in 'UData.pas' {Data: TDataModule},
  FRelatorio in 'FRelatorio.pas' {FRelatorios},
  URelatorio in '..\22_06_18\URelatorio.pas' {TRelatorio},
  URCliente in 'URCliente.pas' {FRCliente},
  URFornecedor in 'URFornecedor.pas' {FRFornecedor},
  URProdutos in 'URProdutos.pas' {FRProduto},
  URVenda in 'URVenda.pas' {FRVenda};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMenu, Menu);
  Application.CreateForm(TFPessoas, FPessoas);
  Application.CreateForm(TFProdutos, FProdutos);
  Application.CreateForm(TFVendas, FVendas);
  Application.CreateForm(TData, Data);
  Application.CreateForm(TFRelatorios, FRelatorios);
  Application.CreateForm(TTRelatorio, TRelatorio);
  Application.CreateForm(TFRCliente, FRCliente);
  Application.CreateForm(TFRFornecedor, FRFornecedor);
  Application.CreateForm(TFRProduto, FRProduto);
  Application.CreateForm(TFRVenda, FRVenda);
  Application.Run;
end.
