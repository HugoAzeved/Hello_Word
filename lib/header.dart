import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hello_word/Home.dart';

void main() {
  runApp(const MeuApp());
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      toolbarHeight: 100,
      title: const Row(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: const Icon(
              Icons.auto_stories,
              color: Colors.white,
              size: 40,
            ),
          ),
          const Text(
            'Book´s Vanilla',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),

      backgroundColor: const Color(0xff2eb54c),
      centerTitle: true,
    ),
    drawer: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.green),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Colors.blueGrey),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(
                    'Não Logado',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Início'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Sobre o App'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(
                context,
              ).pushNamed('/test'); // Usar pushNamed para ir para /test
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configurações'),
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Navegando para Configurações')),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Criar Conta'),
            onTap: () {},
          ),

          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Entrar'),
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Procurando conta...')),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Sair'),
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Saindo...')));
            },
          ),
        ],
      ),
    ),
  );
}
