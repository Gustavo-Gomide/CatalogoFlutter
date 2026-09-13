// =============================================================
// TABBAR & TABBARVIEW — Navegação por abas superiores
// =============================================================
import 'package:flutter/material.dart';

class TabBarExemplo extends StatelessWidget {
  const TabBarExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    // DefaultTabController é necessário para coordenar as abas
    return DefaultTabController(
      length: 3, // Número de abas
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar'),
          // bottom recebe o widget TabBar (fica abaixo do título do appbar)
          bottom: const TabBar(
            // indicatorColor: Colors.white, // Cor da linha inferior ativa
            tabs: [
              Tab(icon: Icon(Icons.directions_car), text: 'Carro'),
              Tab(icon: Icon(Icons.directions_transit), text: 'Trem'),
              Tab(icon: Icon(Icons.directions_bike), text: 'Bike'),
            ],
          ),
        ),
        
        // body recebe o TabBarView, cujos filhos correspondem às abas
        body: const TabBarView(
          children: [
            // O conteúdo deve estar na exata mesma ordem das abas
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.directions_car, size: 64, color: Colors.blue),
                  Text('Conteúdo da aba Carro'),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.directions_transit, size: 64, color: Colors.green),
                  Text('Conteúdo da aba Trem'),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.directions_bike, size: 64, color: Colors.orange),
                  Text('Conteúdo da aba Bike'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
