import 'package:flutter/material.dart';

import 'boxdecoration_exemplo.dart';
import 'cliprrect_exemplo.dart';
import 'opacity_exemplo.dart';
import 'transform_exemplo.dart';
import 'theme_exemplo.dart';

class DecoracaoMenu extends StatelessWidget {
  const DecoracaoMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final exemplos = <_Ex>[
      _Ex('BoxDecoration', 'Bordas, gradientes, sombras', const BoxDecorationExemplo()),
      _Ex('ClipRRect / ClipOval', 'Recortes arredondados e ovais', const ClipRRectExemplo()),
      _Ex('Opacity', 'Transparência de widgets', const OpacityExemplo()),
      _Ex('Transform', 'Rotação, escala, translação', const TransformExemplo()),
      _Ex('ThemeData', 'Cores, tipografia, tema global', const ThemeExemplo()),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('06 — Decoração')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: exemplos.length,
        itemBuilder: (context, index) {
          final ex = exemplos[index];
          return Card(
            child: ListTile(
              title: Text(ex.t, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(ex.s),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ex.w)),
            ),
          );
        },
      ),
    );
  }
}

class _Ex {
  final String t, s;
  final Widget w;
  const _Ex(this.t, this.s, this.w);
}
