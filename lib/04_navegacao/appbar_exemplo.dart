// =============================================================
// APPBAR — Barra superior do aplicativo
// =============================================================
import 'package:flutter/material.dart';

class AppBarExemplo extends StatelessWidget {
  const AppBarExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar básico com várias opções configuradas
      appBar: AppBar(
        // title: O widget principal (geralmente um texto)
        title: const Text('AppBar Completo'),
        
        // centerTitle: Centraliza o título (padrão no iOS, falso no Android)
        centerTitle: true,
        
        // backgroundColor: Cor de fundo
        backgroundColor: Colors.indigo,
        
        // foregroundColor: Cor dos textos e ícones por padrão
        foregroundColor: Colors.white,
        
        // elevation: Sombra abaixo do AppBar (0 remove a sombra)
        elevation: 4,
        
        // leading: Widget à esquerda do título (normalmente ícone de voltar ou menu)
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Ação do menu
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Menu clicado')),
            );
          },
        ),
        
        // actions: Lista de widgets à direita do título
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
        
        // bottom: Um widget que fica abaixo do título (geralmente TabBar ou PreferredSize)
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: Container(
            color: Colors.indigo.shade700,
            width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(4),
            child: const Text('Conteúdo adicional no Bottom', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'O AppBar é a barra no topo.\n'
          'SliverAppBar é a versão que encolhe/desliza no CustomScrollView '
          '(veja o exemplo em layouts).',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
