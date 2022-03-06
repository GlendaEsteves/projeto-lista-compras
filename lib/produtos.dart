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
    return 'Sintoma{nome: $nome, categoria: $categoria, quantidade: $quantidade}';
  }
}
