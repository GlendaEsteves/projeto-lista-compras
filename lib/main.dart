import 'package:flutter/material.dart';
import 'package:lista_de_compras/lista.dart';
import 'package:lista_de_compras/telaProdutos.dart';
import 'package:provider/provider.dart';
import 'produtos.dart';
import 'lista.dart';

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
          Provider(create: (context) => ProdutoModel(nome: '')),
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
      appBar: AppBar(
        title: Text('Lista de Compras'),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  var lista = context.read<ListaModel>();
                  for (var i = 0; i < lista.itemLista.length; i++) {
                    lista.remove(lista.itemLista[i]);
                  }
                },
                child: const Icon(
                  Icons.remove_circle_outline,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8),
            child: _ListaCompras(),
          ))
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

class _ListaCompras extends StatefulWidget {
  @override
  State<_ListaCompras> createState() => _ListaComprasState();
}

class _ListaComprasState extends State<_ListaCompras> {
  @override
  Widget build(BuildContext context) {
    var lista = context.watch<ListaModel>();

    return ListView.builder(
      itemCount: lista.itemLista.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(lista.itemLista[index].nome),
        trailing: FittedBox(
          child: Row(
            children: [
              Text(lista.itemLista[index].quantidade.toString()),
              IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: () => lista.remove(lista.itemLista[index]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
