unit FProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, FMTBcd, DB, SqlExpr, UProduto, UMenu,
  UVendaItem;

type
  TFProdutos = class(TForm)
    Panel1: TPanel;
    txtid: TEdit;
    Label1: TLabel;
    txtDescricao: TEdit;
    Label2: TLabel;
    txtEstoque: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    txtValorUnit: TEdit;
    Label5: TLabel;
    cbUnidade: TComboBox;
    ListView1: TListView;
    btnAlterar: TButton;
    btnSalvar: TButton;
    btnExcluir: TButton;
    btnPesquisar: TButton;
    procedure btnSalvarClick(Sender: TObject);
    procedure limpar();
    procedure btnPesquisarClick(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public

    function CarregarProduto(): TProduto;
    Function ValidarCampos(): Boolean;
  end;

var
  FProdutos: TFProdutos;
  SQLQuery1: TSQLQuery;
  Produto: TProduto;
  itemVenda: TVendaItem;

implementation

uses UData;

{$R *.dfm}

procedure TFProdutos.btnAlterarClick(Sender: TObject);
begin

  if ValidarCampos then
  begin

    itemVenda.pSQLQuery := Data.SQLQuery1;

    if (itemVenda.ExisteVedaProduto(Strtoint(txtid.Text)) < 1) then
    begin

      Produto := TProduto.Create;

      Produto.PDescricao := txtDescricao.Text;
      Produto.pUnidade := cbUnidade.Text;
      Produto.pValor := StrToFloat(txtValorUnit.Text);
      Produto.pQtdEstoque := StrToFloat(txtEstoque.Text);

      // atribuir query antes de gravar
      Produto.pSQLQuery := Data.SQLQuery1;
      Produto.Atualizar(Strtoint(txtid.Text));

      txtid.Text := IntToStr(Produto.pIdPrd);
      ShowMessage('Atualizado com sucesso');
      limpar();
      btnPesquisarClick(Sender);
      txtid.Enabled := true;
    end
    else
      ShowMessage('Produto Sendo Usado Em uma Venda');

  end;
end;

procedure TFProdutos.btnExcluirClick(Sender: TObject);
begin
  if ListView1.ItemIndex >= 0 then
  begin

    Produto.Excluir(Strtoint(ListView1.Items[ListView1.Selected.Index]
      .Caption));
    ListView1.DeleteSelected;

  end
  else
    ShowMessage('Selecione um item para excluir');
end;

procedure TFProdutos.btnPesquisarClick(Sender: TObject);
begin
  ListView1.Clear;
  Produto.pSQLQuery := Data.SQLQuery1;
  Produto.Pesquisar('');
  Produto.pSQLQuery.First;
  while (not Produto.pSQLQuery.eof) do
  begin
    with ListView1.Items.Add do
    begin
      Caption := Produto.pSQLQuery.FieldByName('idPrd').AsString;
      SubItems.Add(Produto.pSQLQuery.FieldByName('descricao').AsString);
      SubItems.Add(Produto.pSQLQuery.FieldByName('unidade').AsString);
      SubItems.Add(Produto.pSQLQuery.FieldByName('valor').AsString);
      SubItems.Add(Produto.pSQLQuery.FieldByName('qtdEstoque').AsString);
    end;
    Produto.pSQLQuery.Next;
  end;
end;

procedure TFProdutos.btnSalvarClick(Sender: TObject);
begin
  if ValidarCampos then
  begin

    Produto := TProduto.Create;

    Produto.PDescricao := txtDescricao.Text;
    Produto.pUnidade := cbUnidade.Text;
    Produto.pValor := StrToFloat(txtValorUnit.Text);
    Produto.pQtdEstoque := StrToFloat(txtEstoque.Text);

    // atribuir query antes de gravar
    Produto.pSQLQuery := Data.SQLQuery1;
    Produto.gravar;

    txtid.Text := IntToStr(Produto.pIdPrd);
    ShowMessage('Gravado com sucesso');
    limpar();
    btnPesquisarClick(Sender);
  end;
end;

function TFProdutos.CarregarProduto: TProduto;
begin

  Produto.pIdPrd := Strtoint(txtid.Text);
  Produto.PDescricao := txtDescricao.Text;
  Produto.pUnidade := cbUnidade.Text;
  Produto.pValor := StrToFloat(txtValorUnit.Text);
  Produto.pQtdEstoque := StrToFloat(txtEstoque.Text);

  Result := Produto;

end;

procedure TFProdutos.FormShow(Sender: TObject);
begin
  Produto := TProduto.Create;
  itemVenda := TVendaItem.Create;
  btnPesquisarClick(Sender);
end;

procedure TFProdutos.limpar;
begin

  txtid.Clear();
  txtDescricao.Clear();
  txtValorUnit.Clear();
  txtEstoque.Clear();
  cbUnidade.ItemIndex := 9;

end;

procedure TFProdutos.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin

  txtid.Text := Item.Caption;
  txtDescricao.Text := Item.SubItems[0];
  cbUnidade.Text := Item.SubItems[1];
  txtValorUnit.Text := Item.SubItems[2];
  txtEstoque.Text := Item.SubItems[3];

  CarregarProduto();
end;

function TFProdutos.ValidarCampos: Boolean;
var
  Controle: Boolean;
begin
  Controle := true;
  if (txtDescricao.Text = '') then
  begin
    ShowMessage('Informe a Descri��o');
    Controle := false;
  end;

  if (txtEstoque.Text = '') then
  begin
    ShowMessage('Informe o Estoque');
    Controle := false;
  end;

  if (txtValorUnit.Text = '') then
  begin
    ShowMessage('Informe o Valor Unitario');
    Controle := false;
  end;

  if (cbUnidade.Text = '') then
  begin
    ShowMessage('Informe a Unidade do Produto');
    Controle := false;
  end;
  Result := Controle;
end;
end.
