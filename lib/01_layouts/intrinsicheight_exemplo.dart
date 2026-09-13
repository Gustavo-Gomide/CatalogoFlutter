// =============================================================
// INTRINSICHEIGHT / INTRINSICWIDTH — Tamanho intrínseco
// =============================================================
// Força filhos a terem a mesma altura/largura (a do maior).
// CUIDADO: É caro em performance. Use com moderação!

import 'package:flutter/material.dart';

class IntrinsicHeightExemplo extends StatelessWidget {
  const IntrinsicHeightExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('IntrinsicHeight / Width')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ----- SEM IntrinsicHeight -----
            const Text('SEM IntrinsicHeight:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Cada filho tem sua própria altura'),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(width: 80, height: 40, color: Colors.red.shade200,
                  alignment: Alignment.center, child: const Text('40px')),
                const SizedBox(width: 8),
                Container(width: 80, height: 80, color: Colors.green.shade200,
                  alignment: Alignment.center, child: const Text('80px')),
                const SizedBox(width: 8),
                Container(width: 80, height: 60, color: Colors.blue.shade200,
                  alignment: Alignment.center, child: const Text('60px')),
              ],
            ),

            const SizedBox(height: 24),

            // ----- COM IntrinsicHeight -----
            const Text('COM IntrinsicHeight:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Todos os filhos ficam com a altura do maior (80px)'),
            const SizedBox(height: 8),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch, // Estica para igualar
                children: [
                  Container(width: 80, color: Colors.red.shade200,
                    alignment: Alignment.center, child: const Text('=80px')),
                  const SizedBox(width: 8),
                  Container(width: 80, height: 80, color: Colors.green.shade200,
                    alignment: Alignment.center, child: const Text('80px')),
                  const SizedBox(width: 8),
                  Container(width: 80, color: Colors.blue.shade200,
                    alignment: Alignment.center, child: const Text('=80px')),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // ----- INTRINSICWIDTH -----
            const Text('IntrinsicWidth:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Todos os filhos ficam com a largura do maior'),
            const SizedBox(height: 8),
            IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(color: Colors.orange.shade200, padding: const EdgeInsets.all(8),
                    child: const Text('Curto')),
                  const SizedBox(height: 4),
                  Container(color: Colors.orange.shade300, padding: const EdgeInsets.all(8),
                    child: const Text('Texto médio aqui')),
                  const SizedBox(height: 4),
                  Container(color: Colors.orange.shade400, padding: const EdgeInsets.all(8),
                    child: const Text('Texto mais longo define a largura')),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ----- AVISO -----
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.amber.shade100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.amber.shade700),
              ),
              child: const Row(
                children: [
                  Icon(Icons.warning, color: Colors.amber),
                  SizedBox(width: 8),
                  Expanded(child: Text(
                    'IntrinsicHeight/Width são caros! '
                    'O Flutter precisa fazer 2 passadas de layout. '
                    'Prefira usar Expanded, Flexible ou CrossAxisAlignment.stretch.',
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
