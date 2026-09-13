// =============================================================
// PAGEVIEW — Navegação por deslizamento de páginas
// =============================================================
import 'package:flutter/material.dart';

class PageViewExemplo extends StatefulWidget {
  const PageViewExemplo({super.key});

  @override
  State<PageViewExemplo> createState() => _PageViewExemploState();
}

class _PageViewExemploState extends State<PageViewExemplo> {
  // O PageController permite controlar em qual página estamos e animar
  final PageController _controller = PageController(initialPage: 0);
  int _paginaAtual = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PageView')),
      // PageView ocupa todo o espaço disponível
      body: PageView(
        controller: _controller,
        // scrollDirection: Axis.vertical, // Descomente para rolar para cima/baixo
        onPageChanged: (indice) {
          setState(() => _paginaAtual = indice);
        },
        children: [
          // Página 0
          Container(
            color: Colors.red.shade100,
            child: const Center(
              child: Text('Página 1\nDeslize para o lado ➔', 
                textAlign: TextAlign.center, style: TextStyle(fontSize: 24)),
            ),
          ),
          // Página 1
          Container(
            color: Colors.green.shade100,
            child: const Center(
              child: Text('Página 2\n➔', 
                textAlign: TextAlign.center, style: TextStyle(fontSize: 24)),
            ),
          ),
          // Página 2
          Container(
            color: Colors.blue.shade100,
            child: const Center(
              child: Text('Página 3\nFim!', 
                textAlign: TextAlign.center, style: TextStyle(fontSize: 24)),
            ),
          ),
        ],
      ),
      
      // Controle inferior opcional
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Página ${_paginaAtual + 1} de 3'),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: _paginaAtual == 0 ? null : () {
                      _controller.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: _paginaAtual == 2 ? null : () {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
