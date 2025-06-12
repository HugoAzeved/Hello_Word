import 'package:flutter/material.dart';
import 'package:hello_word/baseProfessor.dart';
import 'footer.dart';

bool logged = true;
String photoURL = 'static/5.jpg';
String displayName = 'Joca da Silva';

void main(){
  runApp(const Home())
}

class Home extends StatelessWidget {
  const Home ({super.key});

  // Exemplo de variáveis de estado que seriam gerenciadas pelo seu aplicativo
  bool _isLoggedIn = true; // Simula o estado de login
  String _userPhotoUrl = 'https://picsum.photos/200'; // Exemplo de URL de foto
  String _userDisplayName = 'João Silva'; // Exemplo de nome de usuário

  // Função para simular o logout
  void _handleLogout() {
    setState(() {
      _isLoggedIn = false;
      _userDisplayName = 'Convidado'; // Reseta o nome após o logout
      _userPhotoUrl = ''; // Limpa a URL da foto
    });
    // Aqui você faria a lógica real de logout (Firebase, API, etc.)
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Saindo...')),
    );
    Navigator.pop(context); // Fecha o drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        foregroundColor: Colors.white,
        title: const Row(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
              child: Icon(
                Icons.auto_stories,
                color: Colors.white,
                size: 40,
              ),
            ),
            Text(
              'Meu Hello World',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),

      drawer: MyDrawer(
        logged: true, // Passa o estado de login
        photoURL:  'https://picsum.photos/200', // Passa a URL da foto
        displayName: 'João Silva', // Passa o nome de exibição
        onHomeTap: () {
          // Lógica para o item "Início"
          Navigator.pop(context); // Fecha o drawer
          Navigator.popUntil(context, ModalRoute.withName('/')); // Volta para a rota principal
        },
        onAboutTap: () {
          // Lógica para o item "Sobre o App"
          Navigator.pop(context); // Fecha o drawer
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Navegando para Sobre o App')),
          );
          // Navigator.of(context).pushNamed('/about'); // Exemplo de navegação para uma rota '/about'
        },
        onTestPageTap: () {
          // Lógica para o item "Página de Teste"
          Navigator.pop(context); // Fecha o drawer
          Navigator.of(context).pushNamed('/test'); // Navega para a rota '/test'
        },
        onLogoutTap: _handleLogout, // Usa a função de logout definida no estado
      ),

      body: const Center(child: Text('Conteúdo de Olá Mundo!')), // Centralizado para melhor visualização
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: 0,
      ),
    );
  }

  void setState(Null Function() param0) {}
}