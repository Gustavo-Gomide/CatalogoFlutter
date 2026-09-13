import 'package:flutter/material.dart';

import 'animatedcontainer_exemplo.dart';
import 'hero_exemplo.dart';
import 'animatedlist_exemplo.dart';
import 'animatedswitcher_exemplo.dart';

class AnimacoesMenu extends StatelessWidget {
  const AnimacoesMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final exemplos = <_Ex>[
      _Ex('AnimatedContainer', 'Animação implícita de propriedades', const AnimatedContainerExemplo()),
      _Ex('Hero', 'Transição animada entre telas', const HeroExemplo()),
      _Ex('AnimatedList', 'Lista com animação de inserção/remoção', const AnimatedListExemplo()),
      _Ex('AnimatedSwitcher', 'Troca de widget com fade', const AnimatedSwitcherExemplo()),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('07 — Animações')),
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
