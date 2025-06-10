import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useSystemColors: true,
      ),

      initialRoute: '/',

      routes: {
        '/': (context) => const Home(),
        '/test': (context) => const Test(),
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
         "The Book's Vanilla",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xff2eb54c),
        centerTitle: true,
      ),

      drawer: Drawer(
        child: ListView(
          // Importante: Remover qualquer padding extra do ListView para evitar problemas de layout no topo
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Cabeçalho do Drawer (opcional, mas comum para informações do usuário)
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 40, color: Colors.blue),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text(
                      'Usuário Exemplo',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            // Itens de Navegação do Drawer
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Início'),
              onTap: () {
                // Navegar para a Tela Inicial e fechar o drawer
                Navigator.pop(context); // Fecha o drawer
                // Se já estiver na tela inicial, não precisa navegar
                // Navigator.pushNamed(context, '/'); // Exemplo de navegação
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Sobre o App'),
              onTap: () {
                // Navegar para a tela 'Sobre' e fechar o drawer
                Navigator.pop(context); // Fecha o drawer
                // Exemplo de navegação para uma rota nomeada
                // Navigator.pushNamed(context, '/sobre');
                // Ou para uma tela direta:
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const TelaSobre()));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Navegando para Sobre o App')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configurações'),
              onTap: () {
                // Navegar para a tela 'Configurações' e fechar o drawer
                Navigator.pop(context); // Fecha o drawer
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Navegando para Configurações')),
                );
              },
            ),

            // Linha divisória
            const Divider(),

            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Sair'),
              onTap: () {
                // Ação de sair (ex: fazer logout, fechar o aplicativo)
                Navigator.pop(context); // Fecha o drawer
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Saindo...')));
              },
            ),
          ],
        ),
      ),

      body: const Text('Conteúdo de Olá Mundo!'),
      bottomNavigationBar: const Text('Rodapé de Hello World!'),

      
    );
  }
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          'Página de teste',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Text('Conteúdo de Test'),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
        ],
        // currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[200],
        // onTap: _onItemTapped,
        backgroundColor: Colors.orange,
      ),
    );
  }
}
