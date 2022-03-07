import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'produtos.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

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
  List<Produto> listaProdutos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        children: [
          const Center(
            child: Text('Lista de Compras!'),
          ),
        ],
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
              onTap: () async {
                String dadosJson = await DefaultAssetBundle.of(context)
                    .loadString("assets/produtos.json");
                var listaDados = jsonDecode(dadosJson) as List;
                List<Produto> listaProdutos =
                    listaDados.map((e) => Produto.fromJson(e)).toList();
                print(listaProdutos);
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
