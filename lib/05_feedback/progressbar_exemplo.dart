// =============================================================
// PROGRESS INDICATOR — Indicadores de carregamento
// =============================================================
import 'package:flutter/material.dart';

class ProgressbarExemplo extends StatelessWidget {
  const ProgressbarExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress Indicators')),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('CircularProgressIndicator (Infinito):', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Center(
              child: CircularProgressIndicator(),
            ),

            const SizedBox(height: 32),

            const Text('CircularProgressIndicator (Determinado):', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('O valor vai de 0.0 a 1.0 (70% aqui)'),
            const SizedBox(height: 16),
            const Center(
              child: CircularProgressIndicator(
                value: 0.7, // 70%
                strokeWidth: 6, // Espessura
                backgroundColor: Colors.grey, // Fundo cinza
                color: Colors.green, // Cor da barra
              ),
            ),

            const SizedBox(height: 48),

            const Text('LinearProgressIndicator (Infinito):', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const LinearProgressIndicator(),

            const SizedBox(height: 32),

            const Text('LinearProgressIndicator (Determinado):', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: 0.4, // 40%
              minHeight: 10, // Altura da barra
              borderRadius: BorderRadius.circular(5),
              color: Colors.amber,
              backgroundColor: Colors.amber.shade100,
            ),
          ],
        ),
      ),
    );
  }
}
