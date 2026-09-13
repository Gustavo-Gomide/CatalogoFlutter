// BADGE — Indicador de notificação
import 'package:flutter/material.dart';

class BadgeExemplo extends StatelessWidget {
  const BadgeExemplo({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Badge')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Badge com número:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(
              children: [
                Badge(
                  label: const Text('3'), // Texto do badge
                  child: IconButton(onPressed: () {}, icon: const Icon(Icons.notifications, size: 32)),
                ),
                const SizedBox(width: 24),
                Badge(
                  label: const Text('99+'),
                  backgroundColor: Colors.red,
                  child: IconButton(onPressed: () {}, icon: const Icon(Icons.mail, size: 32)),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text('Badge sem texto (ponto):', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Badge(
              smallSize: 10, // Sem label = ponto pequeno
              child: IconButton(onPressed: () {}, icon: const Icon(Icons.chat, size: 32)),
            ),
          ],
        ),
      ),
    );
  }
}
