// =============================================================
// CONSTRAINEDBOX — Define limites mínimos e máximos de tamanho
// =============================================================
// ConstrainedBox adiciona restrições de tamanho ao filho.
// Útil quando quer garantir tamanho mínimo/máximo sem fixar exatamente.

import 'package:flutter/material.dart';

class ConstrainedBoxExemplo extends StatelessWidget {
  const ConstrainedBoxExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ConstrainedBox')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('ConstrainedBox:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Aplica constraints (limites) de tamanho ao filho'),
            const SizedBox(height: 8),

            // BoxConstraints define os limites:
            //   minWidth, maxWidth — largura mínima e máxima
            //   minHeight, maxHeight — altura mínima e máxima
            ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 200,   // Pelo menos 200px de largura
                maxWidth: 300,   // No máximo 300px de largura
                minHeight: 80,   // Pelo menos 80px de altura
              ),
              child: Container(
                color: Colors.blue.shade200,
                alignment: Alignment.center,
                child: const Text('min 200x80 / max 300'),
              ),
            ),

            const SizedBox(height: 24),

            // ----- ATALHOS DE BoxConstraints -----
            const Text('BoxConstraints atalhos:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            // BoxConstraints.tight — tamanho exato
            const Text('  .tight(Size(150, 60)):'),
            ConstrainedBox(
              constraints: BoxConstraints.tight(const Size(150, 60)),
              child: Container(color: Colors.red.shade200, alignment: Alignment.center,
                child: const Text('tight 150x60')),
            ),

            const SizedBox(height: 12),

            // BoxConstraints.expand — ocupa tudo
            const Text('  .expand(height: 60):'),
            ConstrainedBox(
              constraints: const BoxConstraints.expand(height: 60),
              child: Container(color: Colors.green.shade200, alignment: Alignment.center,
                child: const Text('expand — largura total')),
            ),

            const SizedBox(height: 12),

            // BoxConstraints.loose — até um tamanho máximo
            const Text('  .loose(Size(200, 100)):'),
            ConstrainedBox(
              constraints: BoxConstraints.loose(const Size(200, 100)),
              child: Container(color: Colors.purple.shade200, alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                child: const Text('loose — até 200x100')),
            ),

            const SizedBox(height: 24),

            // ----- UNBOUNDED vs BOUNDED -----
            const Text('UnconstrainedBox:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Remove as constraints do pai — filho define seu tamanho'),
            const SizedBox(height: 8),
            Container(
              color: Colors.grey.shade200,
              width: double.infinity,
              height: 80,
              child: UnconstrainedBox(
                child: Container(
                  width: 100,
                  height: 50,
                  color: Colors.orange,
                  alignment: Alignment.center,
                  child: const Text('Livre', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
