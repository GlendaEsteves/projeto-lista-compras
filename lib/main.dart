import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lista_de_compras/lista.dart';
import 'package:lista_de_compras/telaLista.dart';
import 'package:lista_de_compras/telaProdutos.dart';
import 'package:provider/provider.dart';
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
  List<ProdutoModel> listaProdutos = [];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(create: (context) => ProdutoModel(categoria: '', nome: '')),
          ChangeNotifierProxyProvider<ProdutoModel, ListaModel>(
            create: (context) => ListaModel(),
            update: (context, produto, lista) {
              if (lista == null) throw ArgumentError.notNull('lista');
              lista.produto = produto;
              return lista;
            },
          ),
        ],
        child: MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => Home(),
            '/produtos': (context) => TelaProdutos(),
          },
        ));
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Compras')),
      body: Column(
        children: const [
          Center(
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
              onTap: () {
                Navigator.pushNamed(context, '/produtos');
              },
            ),
          ],
        ),
      ),
    );
  }
}
