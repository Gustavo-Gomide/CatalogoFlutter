// =============================================================
// ICON, ICONBUTTON — Ícones do Material Design
// =============================================================
import 'package:flutter/material.dart';

class IconExemplo extends StatelessWidget {
  const IconExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Icon / IconButton')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Icon básico:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Row(
              children: [
                Icon(Icons.home),           // Ícone padrão
                SizedBox(width: 16),
                Icon(Icons.star, color: Colors.amber, size: 32),
                SizedBox(width: 16),
                Icon(Icons.favorite, color: Colors.red, size: 48),
                SizedBox(width: 16),
                Icon(Icons.settings_outlined), // Versão outlined
              ],
            ),

            const SizedBox(height: 24),

            const Text('Ícones comuns:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                for (final item in [
                  (Icons.home, 'home'),
                  (Icons.search, 'search'),
                  (Icons.menu, 'menu'),
                  (Icons.close, 'close'),
                  (Icons.add, 'add'),
                  (Icons.delete, 'delete'),
                  (Icons.edit, 'edit'),
                  (Icons.share, 'share'),
                  (Icons.person, 'person'),
                  (Icons.settings, 'settings'),
                  (Icons.notifications, 'notifications'),
                  (Icons.shopping_cart, 'shopping_cart'),
                  (Icons.arrow_back, 'arrow_back'),
                  (Icons.check, 'check'),
                  (Icons.visibility, 'visibility'),
                  (Icons.lock, 'lock'),
                ])
                  Column(
                    children: [
                      Icon(item.$1, size: 28),
                      Text(item.$2, style: const TextStyle(fontSize: 9)),
                    ],
                  ),
              ],
            ),

            const SizedBox(height: 24),

            const Text('Variações de ícone:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Row(
              children: [
                Column(children: [
                  Icon(Icons.bookmark),
                  Text('filled', style: TextStyle(fontSize: 10)),
                ]),
                SizedBox(width: 24),
                Column(children: [
                  Icon(Icons.bookmark_outlined),
                  Text('outlined', style: TextStyle(fontSize: 10)),
                ]),
                SizedBox(width: 24),
                Column(children: [
                  Icon(Icons.bookmark_rounded),
                  Text('rounded', style: TextStyle(fontSize: 10)),
                ]),
                SizedBox(width: 24),
                Column(children: [
                  Icon(Icons.bookmark_sharp),
                  Text('sharp', style: TextStyle(fontSize: 10)),
                ]),
              ],
            ),

            const SizedBox(height: 24),

            const Text('CircleAvatar com ícone:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.indigo,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                SizedBox(width: 12),
                CircleAvatar(
                  radius: 24,
                  child: Text('AB'), // Iniciais
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
