class ProdutoModel {
  String nome;
  String categoria;
  int quantidade;

  ProdutoModel(
      {required this.nome, this.categoria = 'Outros', this.quantidade = 0});

  Map<String, dynamic> toMap() {
    return {'nome': nome, 'categoria': categoria, 'quantidade': quantidade};
  }

  @override
  String toString() {
    return 'Produto{nome: $nome, categoria: $categoria, quantidade: $quantidade}';
  }

  factory ProdutoModel.fromJson(dynamic json) {
    return ProdutoModel(
        nome: json['nome'] as String, categoria: json['categoria'] as String);
  }
}
