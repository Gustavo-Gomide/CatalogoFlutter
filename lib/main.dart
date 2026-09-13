// =============================================================
// MAIN.DART — Menu Principal do Catálogo de Referência Flutter
// =============================================================
// Este é o ponto de entrada do app. Ele exibe um menu com cards
// clicáveis organizados por categoria. Cada card leva ao menu
// daquela seção, que lista os exemplos individuais.

import 'package:flutter/material.dart';

// Importa os menus de cada seção
import '01_layouts/layouts_menu.dart';
import '02_componentes/componentes_menu.dart';
import '03_inputs/inputs_menu.dart';
import '04_navegacao/navegacao_menu.dart';
import '05_feedback/feedback_menu.dart';
import '06_decoracao/decoracao_menu.dart';
import '07_animacoes/animacoes_menu.dart';
import '08_scrolling/scrolling_menu.dart';

// -----------------------------------------------
// FUNÇÃO MAIN — ponto de entrada de todo app Dart
// -----------------------------------------------
void main() {
  runApp(const CatalogoApp());
}

// -----------------------------------------------
// WIDGET RAIZ — MaterialApp
// -----------------------------------------------
// MaterialApp é o widget que configura o tema, rotas,
// título e a tela inicial (home) do seu app.
class CatalogoApp extends StatelessWidget {
  const CatalogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catálogo Flutter',
      debugShowCheckedModeBanner: false, // Remove o banner "DEBUG"
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
        useMaterial3: true, // Usa Material Design 3 (mais moderno)
      ),
      home: const MenuPrincipal(),
    );
  }
}

// -----------------------------------------------
// TELA DO MENU PRINCIPAL
// -----------------------------------------------
class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de categorias com ícone, título, descrição e tela destino
    final categorias = <_Categoria>[
      _Categoria(
        icone: Icons.grid_view_rounded,
        titulo: '01 — Layouts',
        descricao: 'Row, Column, Stack, Wrap, Grid, Flex, Container...',
        tela: const LayoutsMenu(),
      ),
      _Categoria(
        icone: Icons.widgets_rounded,
        titulo: '02 — Componentes',
        descricao: 'Text, Botões, Image, Icon, Card, Chip, Badge...',
        tela: const ComponentesMenu(),
      ),
      _Categoria(
        icone: Icons.text_fields_rounded,
        titulo: '03 — Inputs',
        descricao: 'TextField, Checkbox, Radio, Switch, Slider, Form...',
        tela: const InputsMenu(),
      ),
      _Categoria(
        icone: Icons.navigation_rounded,
        titulo: '04 — Navegação',
        descricao: 'AppBar, BottomNav, Drawer, TabBar, Navigator...',
        tela: const NavegacaoMenu(),
      ),
      _Categoria(
        icone: Icons.feedback_rounded,
        titulo: '05 — Feedback',
        descricao: 'SnackBar, Dialog, ProgressBar, Banner...',
        tela: const FeedbackMenu(),
      ),
      _Categoria(
        icone: Icons.palette_rounded,
        titulo: '06 — Decoração',
        descricao: 'BoxDecoration, Clip, Opacity, Transform, Theme...',
        tela: const DecoracaoMenu(),
      ),
      _Categoria(
        icone: Icons.animation_rounded,
        titulo: '07 — Animações',
        descricao: 'AnimatedContainer, Hero, AnimatedList, Switcher...',
        tela: const AnimacoesMenu(),
      ),
      _Categoria(
        icone: Icons.swap_vert_rounded,
        titulo: '08 — Scrolling',
        descricao: 'SingleChildScroll, NestedScroll, Reorderable...',
        tela: const ScrollingMenu(),
      ),
    ];

    return Scaffold(
      // ----- AppBar -----
      appBar: AppBar(
        title: const Text('📘 Catálogo Flutter'),
        centerTitle: true,
      ),
      // ----- Corpo: lista de cards -----
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: categorias.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final cat = categorias[index];
          return Card(
            // Card com elevação e borda arredondada
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              leading: CircleAvatar(
                backgroundColor:
                    Theme.of(context).colorScheme.primaryContainer,
                child: Icon(
                  cat.icone,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              title: Text(
                cat.titulo,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(cat.descricao),
              trailing: const Icon(Icons.chevron_right),
              // Navigator.push — navega para a tela da categoria
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => cat.tela),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// -----------------------------------------------
// CLASSE AUXILIAR (modelo de dados simples)
// -----------------------------------------------
class _Categoria {
  final IconData icone;
  final String titulo;
  final String descricao;
  final Widget tela;

  const _Categoria({
    required this.icone,
    required this.titulo,
    required this.descricao,
    required this.tela,
  });
}
