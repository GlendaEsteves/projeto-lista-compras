import 'package:flutter/material.dart';
import './produtos.dart';
import 'package:provider/provider.dart';

class TelaProdutos extends StatefulWidget {
  TelaProdutos(this.listaProdutos, {Key? key}) : super(key: key);

  List<Produto> listaProdutos;
  @override
  State<TelaProdutos> createState() => _TelaProdutosState();
}

class _TelaProdutosState extends State<TelaProdutos> {
  @override
  Widget build(BuildContext context) {
    List<Produto> listaProdutos2 = widget.listaProdutos;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        centerTitle: true,
        title: const Text(
          'Escolha seus itens!',
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(children: <Widget>[
              Expanded(
                  child: ListView(
                children: [
                  ...listaProdutos2.asMap().entries.map((e) {
                    return CriarListTile(title: e.value.nome);
                  })
                ],
              )),
            ])),
      ),
    );
  }
}

class CriarListTile extends StatefulWidget {
  CriarListTile({required this.title});

  String title;

  @override
  _CriarListTileState createState() => _CriarListTileState();
}

class _CriarListTileState extends State<CriarListTile> {
  int _contador = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(widget.title),
          trailing: FittedBox(
            child: Row(
              children: <Widget>[
                _contador != 0
                    ? IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () => setState(() {
                          _contador--;
                        }),
                      )
                    : Container(),
                Text(_contador.toString()),
                IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () => setState(() {
                          _contador++;
                        }))
              ],
            ),
          ),
        )
      ],
    );
  }
}

class Contador extends InheritedWidget {
  final int contador;
  const Contador({
    Key? key,
    required this.contador,
    required Widget child,
  }) : super(key: key, child: child);

  static Contador of(BuildContext context) {
    final Contador? result =
        context.dependOnInheritedWidgetOfExactType<Contador>();
    return result!;
  }

  @override
  bool updateShouldNotify(Contador old) => contador != old.contador;
}
