// =============================================================
// DRAWER — Menu lateral deslizante
// =============================================================
import 'package:flutter/material.dart';

class DrawerExemplo extends StatelessWidget {
  const DrawerExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer (Menu Lateral)'),
        // O Scaffold cria automaticamente o ícone de hambúrguer (menu)
        // no AppBar se houver um Drawer definido.
      ),
      
      // Definindo o Drawer principal (esquerda)
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, // Remove padding do topo do ListView
          children: [
            // Cabeçalho do Drawer (geralmente com foto e email)
            const UserAccountsDrawerHeader(
              accountName: Text('João Silva'),
              accountEmail: Text('joao.silva@exemplo.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('JS', style: TextStyle(fontSize: 24, color: Colors.indigo)),
              ),
              decoration: BoxDecoration(
                color: Colors.indigo,
                // image: DecorationImage(image: NetworkImage('...'), fit: BoxFit.cover),
              ),
            ),
            
            // Itens do menu
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Início'),
              onTap: () {
                // Fecha o drawer
                Navigator.pop(context);
                // Aqui você poderia navegar para a tela inicial
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configurações'),
              onTap: () {
                Navigator.pop(context); // Fecha
              },
            ),
            const Divider(), // Linha divisória
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Sair'),
              onTap: () {
                Navigator.pop(context); // Fecha
              },
            ),
          ],
        ),
      ),

      // Também é possível adicionar um endDrawer (direita)
      // endDrawer: Drawer(...),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Deslize da borda esquerda para abrir o Drawer,'),
            const Text('ou clique no ícone ☰ no AppBar.'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Também é possível abrir o drawer via código usando a key do Scaffold,
                // ou simplesmente:
                Scaffold.of(context).openDrawer();
              },
              child: const Text('Abrir Drawer via Código'),
            ),
          ],
        ),
      ),
    );
  }
}
