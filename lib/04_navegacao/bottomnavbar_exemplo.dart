// =============================================================
// BOTTOMNAVIGATIONBAR / NAVIGATIONBAR — Menu inferior
// =============================================================
import 'package:flutter/material.dart';

class BottomNavBarExemplo extends StatefulWidget {
  const BottomNavBarExemplo({super.key});

  @override
  State<BottomNavBarExemplo> createState() => _BottomNavBarExemploState();
}

class _BottomNavBarExemploState extends State<BottomNavBarExemplo> {
  // Índice da aba atualmente selecionada
  int _indiceAtual = 0;

  // Lista de widgets (telas) para cada aba
  final List<Widget> _telas = const [
    Center(child: Text('Tela Inicial', style: TextStyle(fontSize: 24))),
    Center(child: Text('Tela de Busca', style: TextStyle(fontSize: 24))),
    Center(child: Text('Tela de Perfil', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BottomNavigationBar')),
      
      // O corpo da tela muda de acordo com o índice selecionado
      body: _telas[_indiceAtual],
      
      // Menu inferior clássico (Material 2)
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice) {
          // Atualiza o índice ao tocar em um item
          setState(() => _indiceAtual = indice);
        },
        // Itens do menu
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Busca',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        // Configurações visuais (opcionais)
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        // type: BottomNavigationBarType.shifting, // Animação ao trocar
      ),
    );
  }
}

// ----------------------------------------------------------------------
// OBSERVAÇÃO SOBRE NAVIGATIONBAR (Material 3):
// O Flutter 3.0 introduziu o widget `NavigationBar` (novo padrão M3),
// que substitui o `BottomNavigationBar`. A lógica é a mesma, mas a
// aparência é mais moderna (botões em pílula).
//
// Exemplo de uso do NavigationBar:
//
// bottomNavigationBar: NavigationBar(
//   selectedIndex: _indiceAtual,
//   onDestinationSelected: (indice) => setState(() => _indiceAtual = indice),
//   destinations: const [
//     NavigationDestination(icon: Icon(Icons.home), label: 'Início'),
//     NavigationDestination(icon: Icon(Icons.search), label: 'Busca'),
//     NavigationDestination(icon: Icon(Icons.person), label: 'Perfil'),
//   ],
// )
// ----------------------------------------------------------------------
