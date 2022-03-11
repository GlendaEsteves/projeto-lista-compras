import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lista_de_compras/lista.dart';
import './produtos.dart';
import 'package:provider/provider.dart';

class TelaProdutos extends StatefulWidget {
  @override
  State<TelaProdutos> createState() => _TelaProdutosState();
}

class _TelaProdutosState extends State<TelaProdutos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
            child: const Icon(
              Icons.home,
            ),
          ),
          centerTitle: true,
          title: const Text(
            'Escolha seus itens!',
            style: TextStyle(fontSize: 15),
          ),
        ),
        body: FutureBuilder(
          future: carregarJson(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(child: Text('${data.error}'));
            } else if (data.hasData) {
              List<ProdutoModel> listaProdutos =
                  data.data as List<ProdutoModel>;
              return Center(
                  child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(children: <Widget>[
                        Expanded(
                            child: ListView(
                          children: [
                            ...listaProdutos.asMap().entries.map((e) {
                              return CriarListTile(title: e.value.nome);
                            })
                          ],
                        )),
                      ])));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
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
                        })),
                IconButton(
                    icon: const Icon(Icons.check),
                    onPressed: () => setState(() {
                          var produto = ProdutoModel(
                              nome: widget.title, quantidade: _contador);
                          var lista = context.read<ListaModel>();
                          lista.add(produto);
                        }))
              ],
            ),
          ),
        )
      ],
    );
  }
}

Future<List<ProdutoModel>> carregarJson() async {
  String dadosJson = await rootBundle.loadString("assets/produtos.json");
  var listaDados = jsonDecode(dadosJson) as List;
  List<ProdutoModel> listaProdutos =
      listaDados.map((e) => ProdutoModel.fromJson(e)).toList();
  return listaProdutos;
}
