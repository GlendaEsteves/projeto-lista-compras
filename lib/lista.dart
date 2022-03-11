import 'package:flutter/foundation.dart';
import 'package:lista_de_compras/produtos.dart';

class ListaModel extends ChangeNotifier {
  late ProdutoModel _produto;

  final List<ProdutoModel> itemLista = [];

  ProdutoModel get produto => _produto;

  set produto(ProdutoModel novoProduto) {
    _produto = novoProduto;
    notifyListeners();
  }

  void add(ProdutoModel produto) {
    itemLista.add(produto);
    notifyListeners();
  }

  void remove(ProdutoModel produto) {
    itemLista.remove(produto);
    notifyListeners();
  }
}
