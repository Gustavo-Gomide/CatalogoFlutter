import 'package:flutter/material.dart';

import 'snackbar_exemplo.dart';
import 'dialog_exemplo.dart';
import 'progressbar_exemplo.dart';
import 'shimmer_placeholder_exemplo.dart';
import 'banner_exemplo.dart';

class FeedbackMenu extends StatelessWidget {
  const FeedbackMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final exemplos = <_Ex>[
      _Ex('SnackBar', 'Mensagem temporária na parte inferior', const SnackBarExemplo()),
      _Ex('Dialog', 'AlertDialog, SimpleDialog', const DialogExemplo()),
      _Ex('ProgressIndicator', 'Linear e Circular', const ProgressbarExemplo()),
      _Ex('Placeholder / Skeleton', 'Indicador de carregamento', const PlaceholderExemplo()),
      _Ex('MaterialBanner', 'Banner informativo no topo', const BannerExemplo()),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('05 — Feedback')),
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
