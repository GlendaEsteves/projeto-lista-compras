import 'package:flutter/material.dart';
import './produtos.dart';

class TelaProdutos extends StatefulWidget {
  TelaProdutos(this.listaProdutos);

  List<Produto> listaProdutos;
  @override
  State<TelaProdutos> createState() => _TelaProdutosState();
}

class _TelaProdutosState extends State<TelaProdutos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
