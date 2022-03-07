class Produto {
  String nome;
  String categoria;
  int quantidade;

  Produto({required this.nome, required this.categoria, this.quantidade = 0});

  Map<String, dynamic> toMap() {
    return {'nome': nome, 'categoria': categoria, 'quantidade': quantidade};
  }

  @override
  String toString() {
    return 'Produto{nome: $nome, categoria: $categoria, quantidade: $quantidade}';
  }

  factory Produto.fromJson(dynamic json) {
    return Produto(
        nome: json['nome'] as String, categoria: json['categoria'] as String);
  }
}
