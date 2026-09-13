// =============================================================
// SIZEDBOX — Define tamanho fixo ou cria espaçamento
// =============================================================
// SizedBox é um dos widgets mais simples e úteis:
//   - Define largura e/ou altura fixa
//   - Cria espaçamento entre widgets (substitui margins)
//   - SizedBox.expand() → ocupa todo o espaço disponível
//   - SizedBox.shrink() → tamanho zero

import 'package:flutter/material.dart';

class SizedBoxExemplo extends StatelessWidget {
  const SizedBoxExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SizedBox')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ----- TAMANHO FIXO -----
            const Text('SizedBox com tamanho fixo:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SizedBox(
              width: 200,  // largura fixa
              height: 80,  // altura fixa
              child: Container(
                color: Colors.blue.shade200,
                alignment: Alignment.center,
                child: const Text('200 x 80'),
              ),
            ),

            const SizedBox(height: 24), // <-- ESPAÇAMENTO! Uso mais comum

            // ----- COMO ESPAÇAMENTO -----
            const Text('SizedBox como espaçamento:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(width: 60, height: 40, color: Colors.red),
                const SizedBox(width: 16), // Espaço horizontal
                Container(width: 60, height: 40, color: Colors.green),
                const SizedBox(width: 32), // Espaço maior
                Container(width: 60, height: 40, color: Colors.blue),
              ],
            ),

            const SizedBox(height: 24),

            // ----- SIZEDBOX.EXPAND -----
            const Text('SizedBox.expand():', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Ocupa todo o espaço disponível do pai'),
            const SizedBox(height: 8),
            SizedBox(
              height: 80, // Limitando a altura do container pai
              child: SizedBox.expand(
                child: Container(
                  color: Colors.amber.shade200,
                  alignment: Alignment.center,
                  child: const Text('SizedBox.expand() — ocupa tudo!'),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ----- SIZEDBOX.SHRINK -----
            const Text('SizedBox.shrink():', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Tamanho zero — útil para esconder widgets condicionalmente'),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(width: 60, height: 40, color: Colors.red),
                const SizedBox.shrink(), // Tamanho zero — invisível
                Container(width: 60, height: 40, color: Colors.blue),
              ],
            ),

            const SizedBox(height: 24),

            // ----- SizedBox SÓ COM WIDTH OU HEIGHT -----
            const Text('Só width (altura livre):', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SizedBox(
              width: 150, // Só define a largura
              // height não definido — usa o tamanho natural do filho
              child: Container(
                color: Colors.purple.shade200,
                padding: const EdgeInsets.all(8),
                child: const Text('Largura 150, altura natural do conteúdo'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
