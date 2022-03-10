import 'package:flutter/foundation.dart';
import 'package:lista_de_compras/produtos.dart';

class ListaModel extends ChangeNotifier {
  late ProdutoModel _produto;

  final List<ProdutoModel> _itemLista = [];

  ProdutoModel get produto => _produto;

  set produto(ProdutoModel novoProduto) {
    _produto = novoProduto;
    notifyListeners();
  }

  void add(ProdutoModel produto) {
    ProdutoModel produto = this.produto;
    _itemLista.add(produto);
    notifyListeners();
  }

  void remove(ProdutoModel produto) {
    ProdutoModel produto = this.produto;
    _itemLista.remove(produto);
    // Don't forget to tell dependent widgets to rebuild _every time_
    // you change the model.
    notifyListeners();
  }
}
