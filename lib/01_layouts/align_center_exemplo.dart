// =============================================================
// ALIGN e CENTER — Posicionamento dentro do pai
// =============================================================
// Align posiciona o filho em qualquer ponto do espaço do pai.
// Center é um atalho para Align(alignment: Alignment.center).

import 'package:flutter/material.dart';

class AlignCenterExemplo extends StatelessWidget {
  const AlignCenterExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Align / Center')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ----- ALIGN -----
            const Text('Align:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Posiciona o filho dentro do espaço disponível'),
            const SizedBox(height: 8),

            SizedBox(
              height: 200,
              child: Container(
                color: Colors.grey.shade200,
                child: Stack(
                  children: [
                    // alignment usa coordenadas de -1.0 a 1.0
                    // (-1,-1) = topLeft, (0,0) = center, (1,1) = bottomRight
                    for (final pos in [
                      (Alignment.topLeft, 'topLeft'),
                      (Alignment.topCenter, 'topCenter'),
                      (Alignment.topRight, 'topRight'),
                      (Alignment.centerLeft, 'centerLeft'),
                      (Alignment.center, 'center'),
                      (Alignment.centerRight, 'centerRight'),
                      (Alignment.bottomLeft, 'bottomLeft'),
                      (Alignment.bottomCenter, 'bottomCenter'),
                      (Alignment.bottomRight, 'bottomRight'),
                    ])
                      Align(
                        alignment: pos.$1,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          color: Colors.blue,
                          child: Text(pos.$2, style: const TextStyle(color: Colors.white, fontSize: 8)),
                        ),
                      ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ----- ALIGNMENT PERSONALIZADO -----
            const Text('Alignment personalizado:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Alignment(x, y) — x e y vão de -1.0 a 1.0'),
            const SizedBox(height: 8),
            SizedBox(
              height: 100,
              child: Container(
                color: Colors.grey.shade200,
                child: Align(
                  // Alignment(-0.5, 0.3) → um pouco à esquerda, um pouco abaixo do centro
                  alignment: const Alignment(-0.5, 0.3),
                  child: Container(
                    width: 80,
                    height: 30,
                    color: Colors.purple,
                    alignment: Alignment.center,
                    child: const Text('(-0.5, 0.3)', style: TextStyle(color: Colors.white, fontSize: 10)),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ----- CENTER -----
            const Text('Center:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Atalho para Align(alignment: Alignment.center)'),
            const SizedBox(height: 8),
            SizedBox(
              height: 100,
              child: Container(
                color: Colors.grey.shade200,
                child: const Center(
                  // widthFactor / heightFactor — controla o tamanho do Center
                  // Se não definir, o Center ocupa todo o espaço do pai
                  // Se definir, o Center será X vezes o tamanho do filho
                  child: Text('Centralizado!', style: TextStyle(fontSize: 18)),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ----- FractionalOffset -----
            const Text('FractionalOffset:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Alternativa: coordenadas de 0.0 a 1.0 (em vez de -1 a 1)'),
            const SizedBox(height: 8),
            SizedBox(
              height: 80,
              child: Container(
                color: Colors.grey.shade200,
                child: Align(
                  // FractionalOffset(0, 0) = topLeft
                  // FractionalOffset(1, 1) = bottomRight
                  // FractionalOffset(0.5, 0.5) = center
                  alignment: const FractionalOffset(0.8, 0.2),
                  child: Container(
                    width: 60, height: 30, color: Colors.teal,
                    alignment: Alignment.center,
                    child: const Text('(0.8,0.2)', style: TextStyle(color: Colors.white, fontSize: 10)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
