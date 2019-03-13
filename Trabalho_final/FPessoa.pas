unit FPessoa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, FMTBcd, DB, SqlExpr, UMenu, UPessoa,
  udata, UVendaItem;

type
  TFPessoas = class(TForm)
    Panel1: TPanel;
    txtid: TEdit;
    Label1: TLabel;
    rbCliente: TRadioButton;
    rbFornecedor: TRadioButton;
    txtNome: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    txtEndereco: TEdit;
    Label4: TLabel;
    txtContato: TEdit;
    Label5: TLabel;
    txtCnpJCpf: TEdit;
    Label6: TLabel;
    ListView1: TListView;
    btnSalvar: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnPesquisar: TButton;
    DataNasc: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure btnAlterarClick(Sender: TObject);
    procedure Limpar();
  private
    { Private declarations }
  public
    tipo: string;

    Function CarregarPessoa(): TPessoa;
    Function ValidarCampos(): Boolean;

  end;

var
  FPessoas: TFPessoas;
  SQLQuery1: TSQLQuery;
  Pessoa: TPessoa;
  itemVenda: TVendaItem;

implementation

{$R *.dfm}
{ TFPessoas }

procedure TFPessoas.btnAlterarClick(Sender: TObject);
begin

  if ValidarCampos then
  begin

    itemVenda.pSQLQuery := Data.SQLQuery1;
    if (itemVenda.ExisteCliente(StrToInt(txtid.Text)) < 1) then
    begin
      Pessoa := TPessoa.Create;

      Pessoa.pNome := txtNome.Text;
      Pessoa.pContato := txtContato.Text;
      Pessoa.pEndereco := txtEndereco.Text;
      Pessoa.pData_nasc := DataNasc.Text;

      if (rbCliente.Checked) then
      begin
        Pessoa.pCpf := txtCnpJCpf.Text;
        Pessoa.pCnpj := '0';
        Label6.Caption := 'Cpf';
        tipo := 'C';
      end
      else
      begin
        Pessoa.pCpf := '0';
        Pessoa.pCnpj := txtCnpJCpf.Text;
        tipo := 'F';
        Label6.Caption := 'Cnpj';

      end;
      // atribuir query antes de gravar
      Pessoa.pSQLQuery := Data.SQLQuery1;
      Pessoa.Atualizar(StrToInt(txtid.Text));

      txtid.Text := IntToStr(Pessoa.pIdPes);
      ShowMessage('Atualizado com sucesso');
      Limpar();
      btnPesquisarClick(Sender);
      txtid.Enabled := true;
    end
    else
      ShowMessage(FPessoas.Caption + ' Possui Uma compra');
  end;

end;

procedure TFPessoas.btnSalvarClick(Sender: TObject);
begin
  Pessoa := TPessoa.Create;

  Pessoa.pNome := txtNome.Text;
  Pessoa.pContato := txtContato.Text;
  Pessoa.pEndereco := txtEndereco.Text;
  Pessoa.pData_nasc := DataNasc.Text;
  Pessoa.pTipo := tipo;

  if (tipo = 'C') then
  begin
    Pessoa.pCpf := txtCnpJCpf.Text;
    Pessoa.pCnpj := '0';
    Label6.Caption := 'Cpf';
  end
  else
  begin
    Pessoa.pCpf := '0';
    Pessoa.pCnpj := txtCnpJCpf.Text;
    Label6.Caption := 'Cnpj';

  end;

  if (ValidarCampos = true) then
  begin

    // atribuir query antes de gravar
    Pessoa.pSQLQuery := Data.SQLQuery1;
    Pessoa.gravar;

    txtid.Text := IntToStr(Pessoa.pIdPes);
    ShowMessage('Gravado com sucesso');
    Limpar();
    btnPesquisarClick(Sender);
  end;
end;

function TFPessoas.CarregarPessoa: TPessoa;
begin

  Pessoa.pIdPes := StrToInt(txtid.Text);
  Pessoa.pNome := txtNome.Text;
  Pessoa.pEndereco := txtEndereco.Text;
  Pessoa.pData_nasc := DataNasc.Text;

  if (rbCliente.Checked) then
  begin
    Pessoa.pCpf := txtCnpJCpf.Text;
    Pessoa.pCnpj := '0';
    Pessoa.pTipo := 'C';
    Label6.Caption := 'Cpf';
  end
  else
  begin
    Pessoa.pCpf := '0';
    Pessoa.pCnpj := txtCnpJCpf.Text;;
    Pessoa.pTipo := 'F';
    Label6.Caption := 'Cnpj';
  end;

  Result := Pessoa;
end;

procedure TFPessoas.btnExcluirClick(Sender: TObject);
begin
  itemVenda.pSQLQuery := Data.SQLQuery1;
  if (itemVenda.ExisteCliente(StrToInt(txtid.Text)) < 1) then
  begin
    if ListView1.ItemIndex >= 0 then
    begin

      Pessoa.Excluir(StrToInt(ListView1.Items[ListView1.Selected.Index]
        .Caption));
      ListView1.DeleteSelected;

    end
    else
      ShowMessage('Selecione um item para excluir');
  end
  else
    ShowMessage(FPessoas.Caption + ' Possui uma Compra');

end;

procedure TFPessoas.btnPesquisarClick(Sender: TObject);
begin

  if rbCliente.Checked then
  begin
    tipo := 'C';
  end
  else
  begin
    tipo := 'F';
  end;
  ListView1.Clear;
  Pessoa.pSQLQuery := Data.SQLQuery1;
  Pessoa.Pesquisar(tipo,'');
  Pessoa.pSQLQuery.First;
  while (not Pessoa.pSQLQuery.eof) do
  begin
    with ListView1.Items.Add do
    begin
      Caption := Pessoa.pSQLQuery.FieldByName('idPes').AsString;
      SubItems.Add(Pessoa.pSQLQuery.FieldByName('nome').AsString);
      SubItems.Add(Pessoa.pSQLQuery.FieldByName('endereco').AsString);
      SubItems.Add(Pessoa.pSQLQuery.FieldByName('contato').AsString);
      SubItems.Add(Pessoa.pSQLQuery.FieldByName('dataNasc').AsString);
      SubItems.Add(Pessoa.pSQLQuery.FieldByName('tipo').AsString);
      SubItems.Add(Pessoa.pSQLQuery.FieldByName('cpf').AsString);
      SubItems.Add(Pessoa.pSQLQuery.FieldByName('cnpj').AsString);

    end;
    Pessoa.pSQLQuery.Next;
  end;
end;

procedure TFPessoas.FormShow(Sender: TObject);
begin
  tipo := UMenu.Menu.tipo;

  if (tipo = 'C') then
  begin
    rbCliente.Checked := true;
    Label6.Caption := 'Cpf';
    FPessoas.Caption := 'Cadastro de Cliente'
  end
  else
  begin
    rbFornecedor.Checked := true;
    Label6.Caption := 'Cnpj';
    FPessoas.Caption := 'Cadastro de Fornecedores'
  end;

  Pessoa := TPessoa.Create;
  itemVenda := TVendaItem.Create;
  btnPesquisarClick(Sender);

end;

procedure TFPessoas.Limpar;
begin

  txtid.Clear();
  txtNome.Clear();
  txtEndereco.Clear();
  txtContato.Clear();
  txtCnpJCpf.Clear();
  DataNasc.Clear();
end;

procedure TFPessoas.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  txtid.Text := Item.Caption;
  txtNome.Text := Item.SubItems[0];
  txtEndereco.Text := Item.SubItems[1];
  txtContato.Text := Item.SubItems[2];
  DataNasc.Text := Item.SubItems[3];

  if (Item.SubItems[4] = 'C') then
  begin
    rbCliente.Checked := true;
    Label6.Caption := 'Cpf';
    txtCnpJCpf.Text := Item.SubItems[5];
  end
  else
  begin
    rbFornecedor.Checked := true;
    txtCnpJCpf.Text := Item.SubItems[6];
    Label6.Caption := 'Cnpj';
  end;
  CarregarPessoa();
  txtid.Enabled := false;
end;

function TFPessoas.ValidarCampos: Boolean;
var
  Controle: Boolean;
begin
  Controle := true;
  if (txtNome.Text = '') then
  begin
    ShowMessage('Informe o  Nome');
    Controle := false;
  end;

  if (txtEndereco.Text = '') then
  begin
    ShowMessage('Informe um Endereco');
    Controle := false;
  end;

  if (txtContato.Text = '') then
  begin
    ShowMessage('Informe um Contato');
    Controle := false;
  end;

  if (txtCnpJCpf.Text = '') then
  begin
    if (tipo = 'C') then
    begin
      ShowMessage('Informe o Cpf');
    end
    else
    begin
      ShowMessage('Informe o Cnpj');
    end;
    Controle := false;
  end;

  if (DataNasc.Text = '') then
  begin
    ShowMessage('Informe a Data Nascimento');
    Controle := false;
  end;

  Result := Controle;
end;
end.
