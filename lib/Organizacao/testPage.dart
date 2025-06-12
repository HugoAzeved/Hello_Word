import 'package:flutter/material.dart';
import 'footer.dart';

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
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: 0,
      ),
    );
  }
}


