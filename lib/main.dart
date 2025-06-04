import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Este widget é a raiz da sua aplicação.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Site medonho',
      theme: ThemeData(
        // Este é o tema da sua aplicação.
        //
        // EXPERIMENTE: Tente executar seu aplicativo com "flutter run". Você verá
        // que o aplicativo tem uma barra de ferramentas roxa. Depois, sem fechar o app,
        // tente mudar o seedColor no esquema de cores abaixo para Colors.green
        // e depois utilize o "hot reload" (salve suas alterações ou pressione o botão
        // de hot reload em um IDE compatível com Flutter, ou pressione "r" se estiver
        // usando o terminal para executar o app).
        //
        // Perceba que o contador não voltou para zero; o estado do aplicativo
        // não é perdido durante o reload. Para reiniciar o estado, use o hot restart.
        //
        // Isso também funciona para alterações no código, não apenas em valores:
        // a maioria das mudanças no código pode ser testada apenas com um hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
      ),
      home: const MyHomePage(title: 'Iniciante mechendo no flutter WTF'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // Este widget é a página inicial da sua aplicação. Ele é "stateful",
  // o que significa que possui um objeto de estado (definido abaixo) que contém campos
  // que afetam como ele se apresenta.

  // Esta classe é a configuração do estado. Ela mantém os valores (neste
  // caso o título) fornecidos pelo widget pai (no caso, o MyApp)
  // e que serão usados pelo método build do estado. Os campos em uma subclasse de Widget
  // são sempre marcados como "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // Esta chamada para setState informa ao framework do Flutter que algo foi
      // alterado neste estado, o que faz com que ele execute novamente o método build abaixo
      // para que a tela possa refletir os valores atualizados. Se mudássemos
      // _counter sem chamar setState(), então o método build não seria
      // chamado novamente, e nada pareceria ter acontecido.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Este método é executado novamente toda vez que setState é chamado, por exemplo,
    // pela função _incrementCounter acima.
    //
    // O framework do Flutter foi otimizado para tornar rápida a reexecução dos métodos build,
    // para que você possa simplesmente reconstruir tudo que precisar ser atualizado
    // em vez de modificar manualmente cada parte da interface.

    return Scaffold(
      appBar: AppBar(
        // EXPERIMENTE: Tente mudar a cor aqui para uma cor específica
        // (como Colors.amber, por exemplo) e use o hot reload para ver a AppBar
        // mudando de cor enquanto as outras cores permanecem as mesmas.
          backgroundColor: Colors.pinkAccent[100],
          // Aqui usamos o valor do objeto MyHomePage que foi criado pelo método
        // App.build e o usamos como título da AppBar.
        title: Text(widget.title),
      ),
      body: Center(
        // Center é um widget de layout. Ele recebe um único filho e o posiciona
        // no centro do pai.
        child: Column(
          // Column também é um widget de layout. Ele recebe uma lista de filhos e
          // os organiza verticalmente. Por padrão, ele ajusta seu tamanho para se adequar
          // aos filhos horizontalmente, e tenta ocupar toda a altura do pai.
          //
          // Column possui várias propriedades para controlar como ela se dimensiona e
          // posiciona seus filhos. Aqui usamos o mainAxisAlignment para
          // centralizar os filhos verticalmente; o eixo principal aqui é o eixo vertical,
          // porque Columns são verticais (o eixo cruzado seria o horizontal).
          //
          // EXPERIMENTE: Ative o "debug painting" (escolha a ação "Toggle Debug Paint"
          // no IDE, ou pressione "p" no console), para ver o
          // contorno de cada widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Quantas vezes você tocou no coração:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Incrementar',
        child: const Icon(Icons.favorite),
        backgroundColor: const Color(0xffff0c43),
      ), // Esta vírgula final torna a formatação automática mais agradável para métodos build.
    );
  }
}
