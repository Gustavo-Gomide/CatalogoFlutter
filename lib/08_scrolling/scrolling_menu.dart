import 'package:flutter/material.dart';

import 'singlechildscroll_exemplo.dart';
import 'nestedscroll_exemplo.dart';
import 'reorderablelist_exemplo.dart';
import 'scrollbar_exemplo.dart';

class ScrollingMenu extends StatelessWidget {
  const ScrollingMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final exemplos = <_Ex>[
      _Ex('SingleChildScrollView', 'Scroll simples para conteúdo grande', const SingleChildScrollExemplo()),
      _Ex('NestedScrollView', 'Scroll aninhado com header', const NestedScrollExemplo()),
      _Ex('ReorderableListView', 'Lista reordenável com drag', const ReorderableListExemplo()),
      _Ex('Scrollbar', 'Barra de rolagem customizada', const ScrollbarExemplo()),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('08 — Scrolling')),
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
