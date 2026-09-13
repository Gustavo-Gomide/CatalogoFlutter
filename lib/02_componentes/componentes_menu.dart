import 'package:flutter/material.dart';

import 'text_exemplo.dart';
import 'botoes_exemplo.dart';
import 'imagem_exemplo.dart';
import 'icon_exemplo.dart';
import 'card_exemplo.dart';
import 'chip_exemplo.dart';
import 'divider_exemplo.dart';
import 'badge_exemplo.dart';
import 'tooltip_exemplo.dart';

class ComponentesMenu extends StatelessWidget {
  const ComponentesMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final exemplos = <_Ex>[
      _Ex('Text / RichText', 'Textos, estilos e selecionáveis', const TextExemplo()),
      _Ex('Botões', 'Elevated, Text, Outlined, Icon, FAB', const BotoesExemplo()),
      _Ex('Image', 'Imagens de rede e asset', const ImagemExemplo()),
      _Ex('Icon / IconButton', 'Ícones do Material', const IconExemplo()),
      _Ex('Card', 'Cartão com sombra e conteúdo', const CardExemplo()),
      _Ex('Chip', 'Chip, ActionChip, FilterChip, ChoiceChip', const ChipExemplo()),
      _Ex('Divider', 'Divisor horizontal e vertical', const DividerExemplo()),
      _Ex('Badge', 'Badge de notificação', const BadgeExemplo()),
      _Ex('Tooltip', 'Dica ao segurar/passar o mouse', const TooltipExemplo()),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('02 — Componentes')),
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
