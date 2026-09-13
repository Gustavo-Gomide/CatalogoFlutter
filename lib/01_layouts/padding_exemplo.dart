// =============================================================
// PADDING — Espaçamento INTERNO
// =============================================================
// Padding adiciona espaço DENTRO do widget (entre a borda e o conteúdo).
// Diferente de margin (espaço externo), que é propriedade do Container.
// EdgeInsets é a classe que define quanto espaço em cada lado.

import 'package:flutter/material.dart';

class PaddingExemplo extends StatelessWidget {
  const PaddingExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Padding')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Tipos de EdgeInsets:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),

            // ----- EdgeInsets.all -----
            const Text('EdgeInsets.all(20) — igual em todos os lados:'),
            const SizedBox(height: 4),
            Container(
              color: Colors.blue.shade100,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(color: Colors.blue.shade400, height: 40,
                  alignment: Alignment.center,
                  child: const Text('all(20)', style: TextStyle(color: Colors.white))),
              ),
            ),

            const SizedBox(height: 16),

            // ----- EdgeInsets.symmetric -----
            const Text('EdgeInsets.symmetric(horizontal: 40, vertical: 8):'),
            const SizedBox(height: 4),
            Container(
              color: Colors.green.shade100,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                child: Container(color: Colors.green.shade400, height: 40,
                  alignment: Alignment.center,
                  child: const Text('symmetric', style: TextStyle(color: Colors.white))),
              ),
            ),

            const SizedBox(height: 16),

            // ----- EdgeInsets.only -----
            const Text('EdgeInsets.only(left: 50, top: 20):'),
            const SizedBox(height: 4),
            Container(
              color: Colors.orange.shade100,
              child: Padding(
                padding: const EdgeInsets.only(left: 50, top: 20),
                child: Container(color: Colors.orange.shade400, height: 40,
                  alignment: Alignment.center,
                  child: const Text('only left+top', style: TextStyle(color: Colors.white))),
              ),
            ),

            const SizedBox(height: 16),

            // ----- EdgeInsets.fromLTRB -----
            const Text('EdgeInsets.fromLTRB(10, 30, 50, 5):'),
            const Text('  (Left, Top, Right, Bottom)', style: TextStyle(fontSize: 12)),
            const SizedBox(height: 4),
            Container(
              color: Colors.purple.shade100,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 30, 50, 5),
                child: Container(color: Colors.purple.shade400, height: 40,
                  alignment: Alignment.center,
                  child: const Text('fromLTRB', style: TextStyle(color: Colors.white))),
              ),
            ),

            const SizedBox(height: 24),

            // ----- PADDING vs MARGIN -----
            const Text('Padding vs Margin:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                // Padding — espaço INTERNO
                Expanded(
                  child: Container(
                    color: Colors.red.shade100,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(color: Colors.red, height: 40,
                        alignment: Alignment.center,
                        child: const Text('PADDING\n(interno)', textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 10))),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // Margin — espaço EXTERNO (só Container tem)
                Expanded(
                  child: Container(
                    color: Colors.grey.shade300,
                    child: Container(
                      margin: const EdgeInsets.all(16),
                      color: Colors.blue,
                      height: 40,
                      alignment: Alignment.center,
                      child: const Text('MARGIN\n(externo)', textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 10)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
