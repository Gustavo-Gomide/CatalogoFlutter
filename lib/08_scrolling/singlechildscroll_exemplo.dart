// =============================================================
// SINGLECHILDSCROLLVIEW — Adiciona rolagem a um único filho
// =============================================================
import 'package:flutter/material.dart';

class SingleChildScrollExemplo extends StatelessWidget {
  const SingleChildScrollExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SingleChildScrollView')),
      // SingleChildScrollView faz a tela toda ser rolável.
      // É muito usado junto com o Column quando o conteúdo não cabe na tela
      // (ex: formulários e telas de cadastro, ou telas em dispositivos pequenos).
      body: SingleChildScrollView(
        // scrollDirection: Axis.horizontal, // Pode ser horizontal também
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'O SingleChildScrollView envolve um único filho (geralmente Column ou Row) '
              'e permite que ele role se for maior que a tela, evitando o erro de "RenderFlex overflowed".',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            // Simulando um conteúdo muito grande
            for (int i = 0; i < 20; i++)
              Container(
                height: 80,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 16),
                color: Colors.blue.withValues(alpha: 1 - (i * 0.04)),
                alignment: Alignment.center,
                child: Text('Item ${i + 1}', style: const TextStyle(fontSize: 20)),
              ),
          ],
        ),
      ),
    );
  }
}
