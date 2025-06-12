// Importa a versão do Flutter para Material Design
import 'package:flutter/material.dart';

// Main do Dart
void main() {
  // Rodar a biblioteca Flutter
  runApp(const MyApp());
}

// Definições iniciais do aplicativo que estende 'StatelessWidget'
class MyApp extends StatelessWidget {
  // Construtor da classe 'MyApp'
  // 'super.key' executa o método construtor da superclasse
  const MyApp({super.key});

  // Sobrescreve o método 'build' de 'StatelessWidget'
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Olá Mundo',
      theme: ThemeData(
        // Cor da barra superior do Android
        primarySwatch: Colors.blue,
        // Tamanho padrão da barra superior do Android
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      // rota inicial ao abrir o aplicativo
      initialRoute: '/',

      routes: {
        // Raiz ou página inicial → Home()
        '/': (context) => const Home(), // Lambda
        // Outra rota/página → Test(),
        '/test': (context) => const Test(),
        //rota para a pagina menu
        '/menu':(context) => const Menu(),

      },
    );
  }
}

// Classe que cria o objeto da página inicial → '/'
class Home extends StatelessWidget {
  // Construtor
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Row(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
              child: Icon(Icons.auto_stories, color: Colors.yellow, size: 40),
            ),

            const Text(
              'tela inicial',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              softWrap: true,
            ),
          ],
        ),

        backgroundColor: Colors.green[900],
        centerTitle: true,
      ),

      // Conteúdo principal
      body: const Text('Conteúdo de Olá Mundo!'),

      // Menu principal
      drawer: Drawer(
        child: ListView(
          // IMPORTANTE! REova todo padding da 'ListView'
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Drawer Header'),
            ),

            // Opções do Menu
            ListTile(
              title: const Text('HomePage'),
              onTap: () {
                //Navigator.pop(context); // Fecha o drawer
                Navigator.of(context).pushNamed('/');
              },
            ),

            // Um linha divisória
            const Divider(
              // height: 10,
              color: Colors.blue,
            ),

            ListTile(
              title: const Text('TestPage'),
              onTap: () {
                //Navigator.pop(context); // Fecha o drawer
                Navigator.of(context).pushNamed('/test');
                // ...
              },
            ),

            ListTile(
              title: const Text('Tela de menu'),
              onTap: () {
                Navigator.of(context).pushNamed('/menu');
                // ...
              },
            ),

          ],
        ),
      ),

      // Rodapé
      bottomNavigationBar: const Text('Rodapé de Hello World!'),
    );
  }
}
//----------------------------------------------------testPage---------------------------------------------------

// Sobrescreve o método 'build' de 'StatelessWidget'
@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Pagina teste',
    theme: ThemeData(
      // Cor da barra superior do Android
      primarySwatch: Colors.deepPurple,
      // Tamanho padrão da barra superior do Android
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),

    // rota inicial ao abrir o aplicativo
    initialRoute: '/',

    routes: {
      // Raiz ou página inicial → Home()
      '/': (context) => const Home(), // Lambda
      // Outra rota/página → Test(),
      '/test': (context) => const Test(),
      //rota para a pagina menu
      '/menu':(context) => const Menu(),

    },
  );
}

// Classe que cria o objeto da página test → '/test'

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Row(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
              child: Icon(Icons.enhance_photo_translate_outlined, color: Colors.pink, size: 40),
            ),

            const Text(
              'pagina de teste',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              softWrap: true,
            ),
          ],
        ),

        backgroundColor: Colors.deepPurple[900],
        centerTitle: true,
      ),

      // Conteúdo principal
      body: Builder(
        builder: (BuildContext context) {
      return Center(
        child: ElevatedButton(
          child: const Text('Botão Misterio'),
          onPressed: () {
            Scaffold.of(context).showBottomSheet(
                  (BuildContext context) {
                return Container(
                  height: 500,
                  color: Colors.redAccent,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Text('Fechar'),
                        ElevatedButton(
                          child: const Text('Fechar aba'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      );
    },
    ),



      // Menu principal
      drawer: Drawer(
        child: ListView(
          // IMPORTANTE! REova todo padding da 'ListView'
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Drawer Header'),
            ),

            // Opções do Menu
            ListTile(
              title: const Text('Home Page'),
              onTap: () {
                Navigator.of(context).pushNamed('/');
              },
            ),

            // Um linha divisória
            const Divider(
              // height: 10,
              color: Colors.black87,
            ),

            ListTile(
              title: const Text('Tela de teste'),
              onTap: () {
                Navigator.of(context).pushNamed('/test');
                // ...
              },
            ),

            ListTile(
              title: const Text('Tela de menu'),
              onTap: () {
                Navigator.of(context).pushNamed('/menu');
                // ...
              },
            ),

          ],
        ),
      ),

    );
  }
}

//----------------------------------------------------MenuPage---------------------------------------------------

// Sobrescreve o método 'build' de 'StatelessWidget'

class Menu extends StatelessWidget {
  const Menu({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Pagina fora do ar')),
        body: const Center(child: DialogExample()),
      ),
    );
  }
}

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:
          () => showDialog<String>(
        context: context,
        builder:
            (BuildContext context) => AlertDialog(
          title: const Text('Voltar para o menu?'),
          content: const Text('Essa pagina está com mal funcionamento'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'permanecer'),
              child: const Text('permanecer'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'voltar'),
              child: const Text('voltar'),
            ),
          ],
        ),
      ),
      child: const Text('Voltar?'),
    );
  }
}
