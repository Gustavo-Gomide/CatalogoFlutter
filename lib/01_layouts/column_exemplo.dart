// =============================================================
// COLUMN — Organiza filhos em COLUNA VERTICAL
// =============================================================
// Column funciona igual à Row, mas no eixo VERTICAL.
// O eixo PRINCIPAL (main) é o VERTICAL.
// O eixo CRUZADO (cross) é o HORIZONTAL.

import 'package:flutter/material.dart';

class ColumnExemplo extends StatelessWidget {
  const ColumnExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Column')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ----- COLUMN BÁSICA -----
            const Text('Column básica:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              height: 200,
              color: Colors.grey.shade200,
              child: Column(
                // mainAxisAlignment — como distribuir no eixo VERTICAL
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment — como alinhar no eixo HORIZONTAL
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _caixa('1', Colors.red),
                  _caixa('2', Colors.green),
                  _caixa('3', Colors.blue),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ----- COMPARAÇÃO MainAxisAlignment -----
            const Text('MainAxisAlignment (dentro de Column):', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                for (final align in [
                  MainAxisAlignment.start,
                  MainAxisAlignment.center,
                  MainAxisAlignment.end,
                  MainAxisAlignment.spaceBetween,
                ])
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Column(
                        children: [
                          Text('.${align.name}', style: const TextStyle(fontSize: 10)),
                          Container(
                            height: 150,
                            color: Colors.grey.shade200,
                            child: Column(
                              mainAxisAlignment: align,
                              children: [
                                _mini(Colors.red),
                                _mini(Colors.green),
                                _mini(Colors.blue),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 24),

            // ----- mainAxisSize -----
            const Text('mainAxisSize:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            // .max — ocupa toda a altura disponível (padrão)
            const Text('  .max (padrão) — ocupa toda a altura do pai'),
            // .min — ocupa apenas o necessário
            const Text('  .min — ocupa só o espaço dos filhos'),

            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 150,
                    color: Colors.grey.shade200,
                    child: Column(
                      mainAxisSize: MainAxisSize.max, // Ocupa tudo
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [_mini(Colors.red), _mini(Colors.blue)],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: 150,
                    color: Colors.grey.shade200,
                    // IntrinsicHeight para visualizar o .min
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.amber.shade100,
                        child: Column(
                          mainAxisSize: MainAxisSize.min, // Só o necessário
                          children: [_mini(Colors.red), _mini(Colors.blue)],
                        ),
                      ),
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

  static Widget _caixa(String texto, Color cor) {
    return Container(
      width: 60,
      height: 40,
      color: cor,
      alignment: Alignment.center,
      child: Text(texto, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }

  static Widget _mini(Color cor) {
    return Container(width: 30, height: 30, margin: const EdgeInsets.all(2), color: cor);
  }
}
