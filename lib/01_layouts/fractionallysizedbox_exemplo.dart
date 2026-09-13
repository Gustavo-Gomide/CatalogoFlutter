// =============================================================
// FRACTIONALLYSIZEDBOX — Tamanho em % do pai
// =============================================================
// Define o tamanho do filho como uma FRAÇÃO (%) do espaço disponível.
// widthFactor: 0.5 = 50% da largura do pai
// heightFactor: 0.3 = 30% da altura do pai

import 'package:flutter/material.dart';

class FractionallySizedBoxExemplo extends StatelessWidget {
  const FractionallySizedBoxExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FractionallySizedBox')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('FractionallySizedBox:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Define tamanho como fração (%) do espaço do pai'),
            const SizedBox(height: 16),

            // ----- 80% da largura -----
            const Text('widthFactor: 0.8 (80% da largura):'),
            const SizedBox(height: 4),
            Container(
              height: 60,
              color: Colors.grey.shade200,
              child: FractionallySizedBox(
                widthFactor: 0.8, // 80% da largura do pai
                // alignment — posição dentro do pai
                alignment: Alignment.center,
                child: Container(
                  color: Colors.blue.shade300,
                  alignment: Alignment.center,
                  child: const Text('80%', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ----- 50% da largura -----
            const Text('widthFactor: 0.5 (50% da largura):'),
            const SizedBox(height: 4),
            Container(
              height: 60,
              color: Colors.grey.shade200,
              child: FractionallySizedBox(
                widthFactor: 0.5,
                alignment: Alignment.centerLeft,
                child: Container(
                  color: Colors.green.shade300,
                  alignment: Alignment.center,
                  child: const Text('50%', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ----- Barra de progresso visual -----
            const Text('Exemplo prático — barra de progresso:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            for (final valor in [0.25, 0.5, 0.75, 1.0]) ...[
              Text('${(valor * 100).toInt()}%'),
              Container(
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: FractionallySizedBox(
                  widthFactor: valor,
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ],
        ),
      ),
    );
  }
}
