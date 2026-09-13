// DIVIDER — Linha divisória
import 'package:flutter/material.dart';

class DividerExemplo extends StatelessWidget {
  const DividerExemplo({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Divider')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Divider horizontal:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Item acima'),
            const Divider(), // Linha horizontal simples
            const Text('Item abaixo'),
            const SizedBox(height: 16),
            const Text('Divider customizado:'),
            const Divider(
              height: 40,       // espaço total (inclui a linha + espaço acima/abaixo)
              thickness: 3,     // espessura da linha
              indent: 20,       // recuo à esquerda
              endIndent: 20,    // recuo à direita
              color: Colors.red,
            ),
            const SizedBox(height: 24),
            const Text('VerticalDivider:', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Esquerda'),
                  const VerticalDivider(width: 40, thickness: 2, color: Colors.blue),
                  const Text('Direita'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
