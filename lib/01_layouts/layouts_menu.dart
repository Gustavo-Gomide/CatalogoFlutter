// =============================================================
// LAYOUTS MENU — Menu da seção de Layouts
// =============================================================
import 'package:flutter/material.dart';

import 'row_exemplo.dart';
import 'column_exemplo.dart';
import 'stack_exemplo.dart';
import 'wrap_exemplo.dart';
import 'grid_exemplo.dart';
import 'list_exemplo.dart';
import 'table_exemplo.dart';
import 'flex_exemplo.dart';
import 'sizedbox_exemplo.dart';
import 'container_exemplo.dart';
import 'constrainedbox_exemplo.dart';
import 'aspectratio_exemplo.dart';
import 'fractionallysizedbox_exemplo.dart';
import 'align_center_exemplo.dart';
import 'padding_exemplo.dart';
import 'intrinsicheight_exemplo.dart';
import 'layoutbuilder_exemplo.dart';
import 'customscrollview_exemplo.dart';

class LayoutsMenu extends StatelessWidget {
  const LayoutsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final exemplos = <_Exemplo>[
      _Exemplo('Row', 'Filhos em linha horizontal', const RowExemplo()),
      _Exemplo('Column', 'Filhos em coluna vertical', const ColumnExemplo()),
      _Exemplo('Stack', 'Sobreposição de widgets', const StackExemplo()),
      _Exemplo('Wrap', 'Quebra de linha automática', const WrapExemplo()),
      _Exemplo('GridView', 'Grade de itens', const GridExemplo()),
      _Exemplo('ListView', 'Lista rolável', const ListExemplo()),
      _Exemplo('Table', 'Tabela com linhas e colunas', const TableExemplo()),
      _Exemplo('Expanded / Flexible / Spacer', 'Distribuição de espaço', const FlexExemplo()),
      _Exemplo('SizedBox', 'Tamanho fixo e espaçamento', const SizedBoxExemplo()),
      _Exemplo('Container', 'Caixa com decoração', const ContainerExemplo()),
      _Exemplo('ConstrainedBox', 'Limites mín/máx de tamanho', const ConstrainedBoxExemplo()),
      _Exemplo('AspectRatio', 'Proporção fixa', const AspectRatioExemplo()),
      _Exemplo('FractionallySizedBox', 'Tamanho em % do pai', const FractionallySizedBoxExemplo()),
      _Exemplo('Align / Center', 'Posicionamento dentro do pai', const AlignCenterExemplo()),
      _Exemplo('Padding', 'Espaçamento interno', const PaddingExemplo()),
      _Exemplo('IntrinsicHeight / Width', 'Tamanho intrínseco', const IntrinsicHeightExemplo()),
      _Exemplo('LayoutBuilder', 'Layout responsivo', const LayoutBuilderExemplo()),
      _Exemplo('CustomScrollView + Slivers', 'Scroll avançado', const CustomScrollViewExemplo()),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('01 — Layouts')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: exemplos.length,
        itemBuilder: (context, index) {
          final ex = exemplos[index];
          return Card(
            child: ListTile(
              title: Text(ex.titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(ex.subtitulo),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ex.tela)),
            ),
          );
        },
      ),
    );
  }
}

class _Exemplo {
  final String titulo;
  final String subtitulo;
  final Widget tela;
  const _Exemplo(this.titulo, this.subtitulo, this.tela);
}
