import 'package:flutter/material.dart';

import 'produtos.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const appTitle = 'Lista de Compras';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  final List<Produto> listaProdutos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(
        child: Text('Lista de Compras!'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 100,
              child: const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Menu',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ),
            ListTile(
              title: const Text('Escolha seus itens'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Lista Personalizada'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

final List<Produto> listaProdutos = [
  Produto(nome: 'Água', categoria: 'Bebidas'),
  Produto(nome: 'Cerveja', categoria: 'Bebidas'),
  Produto(nome: 'Refrigerante', categoria: 'Bebidas'),
  Produto(nome: 'Suco', categoria: 'Bebidas'),
  Produto(nome: 'Vinho', categoria: 'Bebidas'),
  Produto(nome: 'Refresco em pó', categoria: 'Bebidas'),
  Produto(nome: 'Sorvete', categoria: 'Doces e Sobremesas'),
  Produto(nome: 'Geléia', categoria: 'Doces e Sobremesas'),
  Produto(nome: 'Gelatina', categoria: 'Doces e Sobremesas'),
  Produto(nome: 'Achocolatado', categoria: 'Matinais'),
  Produto(nome: 'Café', categoria: 'Matinais'),
  Produto(nome: 'Cereal', categoria: 'Matinais'),
  Produto(nome: 'Chá', categoria: 'Matinais'),
  Produto(nome: 'Creme de Leite', categoria: 'Mercearia'),
  Produto(nome: 'Fermento', categoria: 'Mercearia'),
  Produto(nome: 'Leite Condensado', categoria: 'Mercearia'),
  Produto(nome: 'Leite', categoria: 'Mercearia'),
  Produto(nome: 'Amido de Milho', categoria: 'Mercearia'),
  Produto(nome: 'Açucar', categoria: 'Mercearia'),
  Produto(nome: 'Arroz', categoria: 'Mercearia'),
  Produto(nome: 'Feijão', categoria: 'Mercearia'),
  Produto(nome: 'Sal', categoria: 'Mercearia'),
  Produto(nome: 'Milho de Pipoca', categoria: 'Mercearia'),
  Produto(nome: 'Água e Sal', categoria: 'Biscoitos'),
  Produto(nome: 'Recheado', categoria: 'Biscoitos'),
  Produto(nome: 'Salgadinhos', categoria: 'Biscoitos'),
  Produto(nome: 'Waffer', categoria: 'Biscoitos'),
  Produto(nome: 'Chocolate', categoria: 'Chocolates e Balas'),
  Produto(nome: 'Chiclete', categoria: 'Chocolates e Balas'),
  Produto(nome: 'Balas', categoria: 'Chocolates e Balas'),
  Produto(nome: 'Aveia', categoria: 'Produtos Naturais e Dietéticos'),
  Produto(nome: 'Granola', categoria: 'Produtos Naturais e Dietéticos'),
  Produto(nome: 'Barra de Cereal', categoria: 'Produtos Naturais e Dietéticos'),
  Produto(nome: 'Adoçante', categoria: 'Produtos Naturais e Dietéticos'),
  Produto(nome: 'Farinha de Mandioca', categoria: 'Farinhas'),
  Produto(nome: 'Farinha de Milho', categoria: 'Farinhas'),
  Produto(nome: 'Farinha de Trigo', categoria: 'Farinhas'),
  Produto(nome: 'Macarrão', categoria: 'Massas'),
  Produto(nome: 'Lasanha', categoria: 'Massas'),
  Produto(nome: 'Macarrão Instantâneo', categoria: 'Massas'),
  Produto(nome: 'Catchup', categoria: 'Molhos e Temperos'),
  Produto(nome: 'Maionese', categoria: 'Molhos e Temperos'),
  Produto(nome: 'Mostarda', categoria: 'Molhos e Temperos'),
  Produto(nome: 'Extrato de Tomate', categoria: 'Molhos e Temperos'),
  Produto(nome: 'Molho de Tomate', categoria: 'Molhos e Temperos'),
  Produto(nome: 'Molho Inglês', categoria: 'Molhos e Temperos'),
  Produto(nome: 'Molho de Soja', categoria: 'Molhos e Temperos'),
  Produto(nome: 'Vinagre', categoria: 'Molhos e Temperos'),
  Produto(nome: 'Especiarias', categoria: 'Molhos e Temperos'),
  Produto(nome: 'Tempero Pronto', categoria: 'Molhos e Temperos'),
  Produto(nome: 'Atum', categoria: 'Conservas'),
  Produto(nome: 'Sardinha', categoria: 'Conservas'),
  Produto(nome: 'Azeitona', categoria: 'Conservas'),
  Produto(nome: 'Ervilha', categoria: 'Conservas'),
  Produto(nome: 'Milho', categoria: 'Conservas'),
  Produto(nome: 'Palmito', categoria: 'Conservas'),
  Produto(nome: 'Azeite', categoria: 'Óleos'),
  Produto(nome: 'Óleo', categoria: 'Óleos'),
];
