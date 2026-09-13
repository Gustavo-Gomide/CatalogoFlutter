// =============================================================
// STACK — Sobreposição de widgets (um em cima do outro)
// =============================================================
// Stack empilha widgets. O primeiro filho fica "embaixo" e o último "em cima".
// Use Positioned dentro do Stack para posicionar filhos em coordenadas exatas.

import 'package:flutter/material.dart';

class StackExemplo extends StatelessWidget {
  const StackExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stack + Positioned')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ----- STACK BÁSICO -----
            const Text('Stack básico:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Widgets empilhados — o último fica por cima'),
            const SizedBox(height: 8),
            SizedBox(
              height: 150,
              child: Stack(
                // alignment — posição padrão dos filhos NÃO-Positioned
                //   Alignment.topLeft (padrão), .center, .bottomRight, etc.
                alignment: Alignment.center,
                children: [
                  // Primeiro filho — fica embaixo de tudo
                  Container(width: 150, height: 150, color: Colors.red.shade200),
                  // Segundo — fica em cima do primeiro
                  Container(width: 100, height: 100, color: Colors.green.shade300),
                  // Terceiro — fica em cima de tudo
                  Container(width: 50, height: 50, color: Colors.blue.shade400),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ----- POSITIONED -----
            const Text('Positioned:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Posiciona o filho em coordenadas exatas dentro do Stack'),
            const SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  // Fundo
                  Container(color: Colors.grey.shade200),

                  // Positioned com top e left
                  // top: distância do topo
                  // left: distância da esquerda
                  // right: distância da direita
                  // bottom: distância de baixo
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      width: 80,
                      height: 40,
                      color: Colors.red,
                      alignment: Alignment.center,
                      child: const Text('top+left', style: TextStyle(color: Colors.white, fontSize: 11)),
                    ),
                  ),

                  // Positioned no canto inferior direito
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      width: 80,
                      height: 40,
                      color: Colors.blue,
                      alignment: Alignment.center,
                      child: const Text('bottom+right', style: TextStyle(color: Colors.white, fontSize: 11)),
                    ),
                  ),

                  // Positioned.fill — ocupa todo o Stack
                  // (útil para fundo ou overlay)
                  Positioned.fill(
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.black54,
                        child: const Text('Positioned.fill + Center',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ----- STACK FIT -----
            const Text('StackFit:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            // fit — como os filhos não-Positioned devem ser dimensionados
            //   .loose  → filhos podem ser menores que o Stack (padrão)
            //   .expand → filhos são forçados a ocupar todo o Stack
            //   .passthrough → usa as constraints do pai
            const Text('  .loose (padrão) — filhos definem seu próprio tamanho'),
            const Text('  .expand — filhos são forçados a expandir'),
            const Text('  .passthrough — repassa as constraints do pai'),

            const SizedBox(height: 24),

            // ----- CLIPBEHAVIOR -----
            const Text('clipBehavior:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            // clipBehavior — se deve recortar filhos que saem dos limites
            //   Clip.hardEdge — recorta (mais performático)
            //   Clip.none — NÃO recorta (filhos podem "vazar")
            SizedBox(
              height: 100,
              child: Stack(
                clipBehavior: Clip.none, // Permite que filhos saiam dos limites
                children: [
                  Container(width: 200, height: 100, color: Colors.amber.shade200),
                  Positioned(
                    top: -20, // 20px ACIMA do Stack
                    left: 20,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center,
                      child: const Text('Fora!', style: TextStyle(color: Colors.white, fontSize: 11)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
