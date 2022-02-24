import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _nome = '';
  final _nomeController = TextEditingController();
  final _corPrimaria = const Color(0xFF005500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _corPrimaria,
        title: _criarTextoIcone(Icons.emoji_people_rounded, 'Aula 02'),
        centerTitle: true,
      ),
      backgroundColor: Colors.green.shade100,
      body: Column(
        children: [
          _criarMargem(Text(_getBemVindo(), style: const TextStyle(fontSize: 24),),),

          _criarMargem(
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),

          _criarMargem(ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(_corPrimaria),
            ),
            onPressed: _cliqueBotao,
            child: _criarTextoIcone(Icons.person, 'OK'),
          )),
        ],
      ),
    );
  }

  String _getBemVindo() {
    if (_nome.isEmpty) {
      return 'Seja bem vindo';
    }
    return 'Seja bem vindo - $_nome!';
  }

  Widget _criarMargem(Widget objeto) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: objeto,
    );
  }

  Widget _criarTextoIcone(IconData icone, String texto) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icone),
        Text(texto),
      ],
    );
  }

  void _cliqueBotao() {
    setState(() {
      _nome = _nomeController.text;
    });
  }
}