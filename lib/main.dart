// Importa o pacote principal do Flutter com os widgets de Material Design
import 'package:flutter/material.dart';

// Função principal que inicia o app
void main() {
  runApp(const MyApp()); // Inicia o widget raiz do aplicativo
}

// Widget principal do aplicativo
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Construtor com chave opcional para identificação do widget

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Site medonho', // Título do app (usado em algumas plataformas)
      theme: ThemeData(
        // Define o tema usando uma cor base (seedColor)
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
      ),
      // Define a tela inicial do app
      home: const MyHomePage(title: 'Aplicativo rosa'),
    );
  }
}

// Widget com estado (stateful), pois o número de cliques muda
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title; // Título passado para exibição no AppBar

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Classe que gerencia o estado da página inicial
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; // Contador privado (boa prática: usar underline para variáveis privadas)

  // Função chamada quando o botão for pressionado
  void _incrementCounter() {
    // Atualiza o estado da interface (redesenha a tela)
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Estrutura base da tela (barra superior, corpo, botão flutuante, etc.)
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent[100], // Cor personalizada para a AppBar
        title: Text(widget.title), // Usa o título recebido no widget pai
      ),
      body: Center(
        // Centraliza o conteúdo na tela
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centraliza os filhos na vertical
          children: <Widget>[
            const Text('Quantas vezes você tocou no coração:'),
            Text(
              '$_counter', // Mostra o valor do contador
              style: Theme.of(context).textTheme.headlineMedium, // Usa estilo do tema
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter, // Ação ao pressionar o botão
        tooltip: 'Incrementar', // Texto exibido ao segurar o botão
        child: const Icon(Icons.local_see), // Ícone do botão
        backgroundColor: const Color(0xffff0c43), // Cor personalizada
      ),
    );
  }
}