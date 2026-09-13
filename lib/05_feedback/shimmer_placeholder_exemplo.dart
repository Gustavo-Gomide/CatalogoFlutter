// =============================================================
// PLACEHOLDER — Espaço reservado provisório
// =============================================================
import 'package:flutter/material.dart';

class PlaceholderExemplo extends StatelessWidget {
  const PlaceholderExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Placeholder')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Placeholder é útil durante o desenvolvimento quando você '
              'ainda não criou o widget final e precisa marcar o espaço.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            
            // Placeholder padrão
            const Placeholder(
              fallbackHeight: 100, // Altura se estiver num lugar não-limitado
            ),
            
            const SizedBox(height: 24),

            // Placeholder customizado
            const Placeholder(
              color: Colors.red,
              strokeWidth: 4, // Linha mais grossa
              fallbackHeight: 150,
            ),

            const SizedBox(height: 24),

            Row(
              children: [
                const Expanded(
                  child: Text('Espaço de um ícone que ainda não tenho:'),
                ),
                // Usando placeholder num tamanho fixo
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Placeholder(color: Colors.green.shade300),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
