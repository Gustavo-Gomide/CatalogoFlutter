// =============================================================
// NAVIGATIONRAIL — Menu lateral fixo (ideal para tablets/desktop)
// =============================================================
import 'package:flutter/material.dart';

class NavigationRailExemplo extends StatefulWidget {
  const NavigationRailExemplo({super.key});

  @override
  State<NavigationRailExemplo> createState() => _NavigationRailExemploState();
}

class _NavigationRailExemploState extends State<NavigationRailExemplo> {
  int _indiceAtual = 0;

  final List<Widget> _telas = const [
    Center(child: Text('Início', style: TextStyle(fontSize: 24))),
    Center(child: Text('Favoritos', style: TextStyle(fontSize: 24))),
    Center(child: Text('Configurações', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    // NavigationRail costuma ser usado dentro de um Row para ficar ao lado do conteúdo
    return Scaffold(
      appBar: AppBar(title: const Text('NavigationRail')),
      body: Row(
        children: [
          // A Barra Lateral
          NavigationRail(
            selectedIndex: _indiceAtual,
            onDestinationSelected: (int index) {
              setState(() => _indiceAtual = index);
            },
            // labelType: Como os textos aparecem
            labelType: NavigationRailLabelType.all, // selected, none ou all
            
            // Opcional: Widget no topo do rail (ex: avatar ou botão FAB)
            leading: FloatingActionButton(
              elevation: 0,
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
            
            // Os destinos (abas)
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: Text('Início'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.favorite_outline),
                selectedIcon: Icon(Icons.favorite),
                label: Text('Favoritos'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings),
                label: Text('Ajustes'),
              ),
            ],
          ),
          
          // Uma linha vertical separando o rail do conteúdo
          const VerticalDivider(thickness: 1, width: 1),
          
          // O conteúdo que ocupa o resto do espaço
          Expanded(
            child: _telas[_indiceAtual],
          ),
        ],
      ),
    );
  }
}
