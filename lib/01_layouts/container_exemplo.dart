// =============================================================
// CONTAINER — A "caixa" mais versátil do Flutter
// =============================================================
// Container é uma combinação de vários widgets:
// Padding + Align + DecoratedBox + ConstrainedBox + Transform
// Use quando precisa de decoração (cor, borda, sombra, gradiente).

import 'package:flutter/material.dart';

class ContainerExemplo extends StatelessWidget {
  const ContainerExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Container')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ----- CONTAINER BÁSICO -----
            const Text('Container básico:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              // width e height — tamanho fixo
              width: 200,
              height: 80,
              // color — cor de fundo (NÃO pode usar junto com decoration!)
              color: Colors.blue,
              // alignment — onde posicionar o filho dentro do container
              //   Alignment.center, .topLeft, .bottomRight, etc.
              //   Alignment(x, y) — x e y de -1.0 a 1.0
              alignment: Alignment.center,
              // margin — espaço EXTERNO (ao redor do container)
              margin: const EdgeInsets.all(8),
              // padding — espaço INTERNO (entre a borda e o filho)
              padding: const EdgeInsets.all(16),
              child: const Text('Container', style: TextStyle(color: Colors.white)),
            ),

            const SizedBox(height: 16),

            // ----- CONTAINER COM DECORATION -----
            const Text('Container com BoxDecoration:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              width: double.infinity, // Ocupa toda a largura
              padding: const EdgeInsets.all(20),
              // decoration — decoração avançada (borda, sombra, gradiente, etc.)
              // ATENÇÃO: NÃO use 'color' E 'decoration' ao mesmo tempo!
              // Coloque a cor dentro da decoration.
              decoration: BoxDecoration(
                color: Colors.white,
                // borderRadius — arredondamento dos cantos
                borderRadius: BorderRadius.circular(16),
                // border — borda
                border: Border.all(color: Colors.indigo, width: 2),
                // boxShadow — sombra
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 8,    // desfoque
                    offset: const Offset(2, 4), // deslocamento x, y
                  ),
                ],
              ),
              child: const Text('Com borda, sombra e cantos arredondados'),
            ),

            const SizedBox(height: 24),

            // ----- CONTAINER COM GRADIENTE -----
            const Text('Container com gradiente:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                // gradient — gradiente de cores
                gradient: const LinearGradient(
                  colors: [Colors.purple, Colors.blue, Colors.cyan],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: const Text('LinearGradient', style: TextStyle(color: Colors.white, fontSize: 18)),
            ),

            const SizedBox(height: 24),

            // ----- CONTAINER COM CONSTRAINTS -----
            const Text('Container com constraints:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              // constraints — limites de tamanho
              constraints: const BoxConstraints(
                minWidth: 100,
                maxWidth: 300,
                minHeight: 50,
                maxHeight: 100,
              ),
              color: Colors.teal.shade200,
              alignment: Alignment.center,
              child: const Text('min 100x50 / max 300x100'),
            ),

            const SizedBox(height: 24),

            // ----- CONTAINER COM TRANSFORM -----
            const Text('Container com transform:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Center(
              child: Container(
                width: 100,
                height: 50,
                // transform — aplica transformação (rotação, escala, etc.)
                transform: Matrix4.rotationZ(0.1), // Rotação em radianos
                // transformAlignment — ponto de origem da transformação
                transformAlignment: Alignment.center,
                color: Colors.orange,
                alignment: Alignment.center,
                child: const Text('Rotacionado!', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
