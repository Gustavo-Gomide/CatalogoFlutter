// TOOLTIP — Dica ao segurar/passar o mouse
import 'package:flutter/material.dart';

class TooltipExemplo extends StatelessWidget {
  const TooltipExemplo({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tooltip')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Tooltip:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Segure o widget para ver a dica (ou passe o mouse)'),
            const SizedBox(height: 24),
            const Tooltip(
              message: 'Esta é a dica!', // Texto da dica
              child: Icon(Icons.info, size: 48),
            ),
            const SizedBox(height: 24),
            Tooltip(
              message: 'Botão customizado',
              // Propriedades opcionais:
              waitDuration: const Duration(milliseconds: 500), // Tempo para aparecer
              showDuration: const Duration(seconds: 2),        // Tempo visível
              preferBelow: false,                                // Mostra acima
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(8),
              ),
              textStyle: const TextStyle(color: Colors.white),
              child: ElevatedButton(onPressed: () {}, child: const Text('Com Tooltip')),
            ),
          ],
        ),
      ),
    );
  }
}
