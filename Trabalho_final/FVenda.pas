unit FVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, FMTBcd, DB, SqlExpr, UVendaItem,
  UVenda;

type
  TFVendas = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    txtIdV: TEdit;
    Label3: TLabel;
    txtIdPes: TEdit;
    Label4: TLabel;
    txtCnpjCpf: TEdit;
    Label5: TLabel;
    txtNome: TEdit;
    Label6: TLabel;
    txtPrecoUnit: TEdit;
    Label7: TLabel;
    txtDescricao: TEdit;
    Label8: TLabel;
    txtidProduto: TEdit;
    Label9: TLabel;
    txtAcrescimo: TEdit;
    Label10: TLabel;
    txtQuantidade: TEdit;
    Label11: TLabel;
    txtEstoque: TEdit;
    cbStatus: TComboBox;
    Label12: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Button1: TButton;
    btnAlterar: TButton;
    btnSalvar: TButton;
    Panel2: TPanel;
    Label13: TLabel;
    txtDesconto: TEdit;
    Label14: TLabel;
    ListView1: TListView;
    Button2: TButton;
    Button6: TButton;
    Button7: TButton;
    Button9: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure GerarVenda();
    procedure VenderItem();
    procedure LimparCompra();
    procedure AlimentarGrid();
    procedure ButtonClick(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure Button5Click(Sender: TObject);
    function ValidarCampos: Boolean;

  private
    { Private declarations }
    numeroNota: Integer;
  public
    { Public declarations }
  end;

var
  FVendas: TFVendas;
  SQLQuery1: TSQLQuery;
  vendasItem: TVendaItem;
  venda: TVenda;

implementation

uses FPessoa, UPessoa, FProduto, UProduto, UData;

{$R *.dfm}

procedure TFVendas.AlimentarGrid;
var
  qtd, valor, desconto, acrecimo: double;
begin

  ListView1.Clear;
  vendasItem.pSQLQuery := Data.SQLQuery1;
  vendasItem.Pesquisar(numeroNota);
  vendasItem.pSQLQuery.First;
  while (not vendasItem.pSQLQuery.eof) do
  begin
    with ListView1.Items.Add do
    begin
      Caption := vendasItem.pSQLQuery.FieldByName('Produto').AsString;
      SubItems.Add(vendasItem.pSQLQuery.FieldByName('descricao').AsString);
      SubItems.Add(vendasItem.pSQLQuery.FieldByName('qtdVenda').AsString);
      SubItems.Add(vendasItem.pSQLQuery.FieldByName('valorUnitario').AsString);
      SubItems.Add(vendasItem.pSQLQuery.FieldByName('desconto').AsString);
      SubItems.Add(vendasItem.pSQLQuery.FieldByName('acrecimo').AsString);

      qtd := StrToFloat((vendasItem.pSQLQuery.FieldByName('qtdVenda')
        .AsString));
      valor := StrToFloat((vendasItem.pSQLQuery.FieldByName('valorUnitario')
        .AsString));
      desconto := StrToFloat((vendasItem.pSQLQuery.FieldByName('desconto')
        .AsString));
      acrecimo := StrToFloat((vendasItem.pSQLQuery.FieldByName('acrecimo')
        .AsString));

      SubItems.Add(FloatToStr(valor + acrecimo - desconto));
      SubItems.Add(FloatToStr(qtd * (valor + acrecimo - desconto)));

    end;
    vendasItem.pSQLQuery.Next;
  end;
end;

procedure TFVendas.btnAlterarClick(Sender: TObject);
begin
  numeroNota := StrtoInt(InputBox('Informe o numero da Nota', '', ''));

  venda.pSQLQuery := Data.SQLQuery1;
  venda.PesquisarVenda(numeroNota);

  txtIdV.Text := venda.pSQLQuery.FieldByName('idV').AsString;
  cbStatus.Text := 'Alterando';
  if ((venda.pSQLQuery.FieldByName('Tipo').AsString) = 'c') then
  begin
    RadioButton1.Checked := true;
    txtCnpjCpf.Text := venda.pSQLQuery.FieldByName('cpf').AsString
  end
  else
  begin
    RadioButton2.Checked := true;
    txtCnpjCpf.Text := venda.pSQLQuery.FieldByName('cnpj').AsString
  end;

  txtNome.Text := (venda.pSQLQuery.FieldByName('nome').AsString);
  txtIdPes.Text := (venda.pSQLQuery.FieldByName('idPes').AsString);

  AlimentarGrid();
end;

procedure TFVendas.btnSalvarClick(Sender: TObject);
begin
  venda.pSQLQuery := Data.SQLQuery1;
  venda.FinalizarCompra(numeroNota);
  cbStatus.Text := 'Finalizado';
  ShowMessage('Compra Efetuada Com Sucesso');
end;

procedure TFVendas.Button1Click(Sender: TObject);
var
  pessoa: TPessoa;
  tipo: String;
begin

  FPessoas.showModal;

  pessoa := FPessoas.CarregarPessoa();
  txtIdPes.Text := IntToStr(pessoa.pIdPes);
  txtNome.Text := pessoa.pNome;

  if (pessoa.pTipo = 'C') then
  begin
    txtCnpjCpf.Text := pessoa.pCpf;
    RadioButton1.Checked := true;
  end
  else
  begin
    txtCnpjCpf.Text := pessoa.pCnpj;
    RadioButton2.Checked := true;

  end;
end;

procedure TFVendas.Button2Click(Sender: TObject);
var
  Produto: TProduto;
begin

  FProdutos.showModal;

  Produto := FProdutos.CarregarProduto();
  txtidProduto.Text := IntToStr(Produto.pIdPrd);
  txtDescricao.Text := Produto.PDescricao;
  txtPrecoUnit.Text := FloatToStr(Produto.pValor);
  txtEstoque.Text := FloatToStr(Produto.pQtdEstoque);

end;

procedure TFVendas.Button3Click(Sender: TObject);
begin

  if (ValidarCampos) then
  begin
    if (StrtoInt(txtQuantidade.Text) <= StrtoInt(txtEstoque.Text)) then
    begin
      txtEstoque.Text :=
        FloatToStr((StrToFloat(txtEstoque.Text) -
        StrToFloat(txtQuantidade.Text)));

      if (numeroNota < 1) then
      begin
        GerarVenda();
      end;

      if (numeroNota > 0) then
      begin
        VenderItem()
      end;
    end
    else
      ShowMessage('Estoque nao Disponivel');
  end;
end;

procedure TFVendas.Button4Click(Sender: TObject);
begin
  txtIdV.Text := '0';
end;

procedure TFVendas.Button5Click(Sender: TObject);
begin
  LimparCompra();
  AlimentarGrid();

  txtidProduto.Enabled := true;
  txtDescricao.Enabled := true;
  txtPrecoUnit.Enabled := true;
  Button2.Enabled := true;
end;

procedure TFVendas.ButtonClick(Sender: TObject);
begin
  AlimentarGrid();
end;

procedure TFVendas.Button6Click(Sender: TObject);
begin
  numeroNota := StrtoInt(InputBox('Informe o numero da Nota ',
    'Deseja Realmente Excluir', ''));

  venda.pSQLQuery := Data.SQLQuery1;
  venda.ExcluirItemVenda(numeroNota);
  venda.ExcluirVenda(numeroNota);

end;

procedure TFVendas.Button7Click(Sender: TObject);
begin

  if ValidarCampos then
  begin

    if (StrtoInt(txtQuantidade.Text) <= StrtoInt(txtEstoque.Text)) then
    begin

      vendasItem := TVendaItem.Create;

      vendasItem.pidProduto := StrtoInt(txtidProduto.Text);
      vendasItem.pidVenda := numeroNota;
      vendasItem.pQtdVenda := StrtoInt(txtQuantidade.Text);
      vendasItem.pValorUnitario := StrToFloat(txtPrecoUnit.Text);
      vendasItem.pDesconto := StrToFloat(txtDesconto.Text);
      vendasItem.pAcrecimo := StrToFloat(txtAcrescimo.Text);

      // atribuir query antes de gravar
      vendasItem.pSQLQuery := Data.SQLQuery1;
      vendasItem.alterar(StrtoInt(txtidProduto.Text), numeroNota);

      ShowMessage('Item Alterado com Sucesso');
      LimparCompra();
      AlimentarGrid();

      txtidProduto.Enabled := true;
      txtDescricao.Enabled := true;
      txtPrecoUnit.Enabled := true;
      Button2.Enabled := true;
    end
    else
      ShowMessage('Estoque nao Disponivel');
  end;
end;

procedure TFVendas.Button9Click(Sender: TObject);
var
  Item: Integer;
begin

  Item := StrtoInt(InputBox('Informe o Item para Exclus�o ',
    'Deseja Realmente Excluir', ''));

  vendasItem.pSQLQuery := Data.SQLQuery1;
  vendasItem.ExcluirItemVenda(numeroNota, Item);

  AlimentarGrid();
end;

procedure TFVendas.FormShow(Sender: TObject);
begin
  numeroNota := 0;
  cbStatus.Text := 'Andamento';
  venda := TVenda.Create();
  vendasItem := TVendaItem.Create();

  vendasItem.pSQLQuery := Data.SQLQuery1;
end;

procedure TFVendas.GerarVenda;
begin

  venda := TVenda.Create;

  venda.pdata := DateToStr(now);
  venda.pStatus := cbStatus.Text;
  if (RadioButton1.Checked) then
  begin
    venda.pTipo := 'C';
  end
  else
    venda.pTipo := 'F';

  venda.pidCliente := StrtoInt(txtIdPes.Text);

  // atribuir query antes de gravar
  venda.pSQLQuery := Data.SQLQuery1;
  venda.gravar;

  venda.PegarIndice();
  numeroNota := venda.pIdV;
  txtIdV.Text := IntToStr(venda.pIdV);

  if (numeroNota = 0) then
  begin
    numeroNota := 1;
  end;

end;

procedure TFVendas.LimparCompra;
begin
  txtidProduto.Text := '';
  txtDescricao.Text := '';
  txtPrecoUnit.Text := '';
  txtEstoque.Text := '';
  txtQuantidade.Text := '';
  txtAcrescimo.Text := '';
  txtDesconto.Text := '';
end;

procedure TFVendas.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin

  txtidProduto.Text := Item.Caption;
  txtDescricao.Text := Item.SubItems[0];
  txtQuantidade.Text := Item.SubItems[1];
  txtPrecoUnit.Text := Item.SubItems[2];
  txtDesconto.Text := Item.SubItems[3];
  txtAcrescimo.Text := Item.SubItems[4];

  Produto := TProduto.Create();
  Produto.pSQLQuery := Data.SQLQuery1;
  Produto.PegarEstoque(StrtoInt(txtidProduto.Text));
  txtEstoque.Text := FloatToStr(Produto.pQtdEstoque);
  txtidProduto.Enabled := false;
  txtDescricao.Enabled := false;
  txtPrecoUnit.Enabled := false;
  txtEstoque.Enabled := false;
  Button2.Enabled := false;

end;

function TFVendas.ValidarCampos: Boolean;
var
  Controle: Boolean;
begin
  Controle := true;

  if (txtDescricao.Text = '') then
  begin
    ShowMessage('Informe a Descri��o do Produto');
    Controle := false;
  end;

  if (txtNome.Text = '') then
  begin
    ShowMessage('Informe o  Nome do Comprador ');
    Controle := false;
  end;

  if (txtAcrescimo.Text = '') then
  begin
    ShowMessage('Informe o valor do Acrecimo');
    Controle := false;
  end;

  if (txtDesconto.Text = '') then
  begin
    ShowMessage('Informe o valor do Desconto');
    Controle := false;
  end;

  if (txtQuantidade.Text = '') then
  begin
    ShowMessage('Informe a Quantidade');
    Controle := false;
  end;

  Result := Controle;

end;

procedure TFVendas.VenderItem;
begin
  vendasItem := TVendaItem.Create;

  vendasItem.pidProduto := StrtoInt(txtidProduto.Text);
  vendasItem.pidVenda := numeroNota;
  vendasItem.pQtdVenda := StrtoInt(txtQuantidade.Text);
  vendasItem.pValorUnitario := StrToFloat(txtPrecoUnit.Text);
  vendasItem.pDesconto := StrToFloat(txtDesconto.Text);
  vendasItem.pAcrecimo := StrToFloat(txtAcrescimo.Text);

  // atribuir query antes de gravar
  vendasItem.pSQLQuery := Data.SQLQuery1;
  vendasItem.gravar;

  ShowMessage('Item Adicionado ao Carrinho');
  LimparCompra();
  AlimentarGrid();
end;
end.
