import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bottom Bar with Badge')),
      body: Center(
        child: Text('Página ${_selectedIndex + 1}'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xff2eb54c),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Badge.count(
              count: 5,
              child: const Icon(Icons.favorite),
            ),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Badge(
              label: const Text('Novo'),
              child: const Icon(Icons.shopping_cart),
            ),
            label: 'Compras',
          ),
          BottomNavigationBarItem(
            icon: Badge(
              label: const Text('Novo'),
              child: const Icon(Icons.notifications),
            ),
            label: 'Notificações',
          ),
        ],
      ),
    );
  }
}
