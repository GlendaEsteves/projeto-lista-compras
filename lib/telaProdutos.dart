import 'package:flutter/material.dart';
import './produtos.dart';

class TelaProdutos extends StatefulWidget {
  TelaProdutos(this.listaProdutos, {Key? key}) : super(key: key);

  List<Produto> listaProdutos;
  @override
  State<TelaProdutos> createState() => _TelaProdutosState();
}

class _TelaProdutosState extends State<TelaProdutos> {
  int _contador = 0;
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
                  child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: listaProdutos2.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      height: 50,
                      color: Colors.white,
                      child: ListTile(
                        title: Text(listaProdutos2[index].nome),
                        trailing: FittedBox(
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                  onPressed: () => setState(() {
                                        if (_contador > 0) {
                                          _contador--;
                                        }
                                      }),
                                  icon: const Icon(Icons.remove)),
                              Text(_contador.toString()),
                              IconButton(
                                  onPressed: () => setState(() {
                                        if (_contador >= 0) {
                                          _contador++;
                                        }
                                      }),
                                  icon: const Icon(Icons.add)),
                            ],
                          ),
                        ),
                      ));
                },
              )),
            ])),
      ),
    );
  }
}
