import 'package:flutter/material.dart';

import 'appbar_exemplo.dart';
import 'bottomnavbar_exemplo.dart';
import 'navigationrail_exemplo.dart';
import 'drawer_exemplo.dart';
import 'tabbar_exemplo.dart';
import 'bottomsheet_exemplo.dart';
import 'navigator_exemplo.dart';
import 'pageview_exemplo.dart';

class NavegacaoMenu extends StatelessWidget {
  const NavegacaoMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final exemplos = <_Ex>[
      _Ex('AppBar / SliverAppBar', 'Barra superior', const AppBarExemplo()),
      _Ex('BottomNavigationBar', 'Barra inferior de navegação', const BottomNavBarExemplo()),
      _Ex('NavigationRail', 'Navegação lateral (tablet/desktop)', const NavigationRailExemplo()),
      _Ex('Drawer', 'Menu hambúrguer lateral', const DrawerExemplo()),
      _Ex('TabBar + TabBarView', 'Abas deslizantes', const TabBarExemplo()),
      _Ex('BottomSheet', 'Painel inferior (modal/persistente)', const BottomSheetExemplo()),
      _Ex('Navigator (push/pop)', 'Navegação entre telas', const NavigatorExemplo()),
      _Ex('PageView', 'Swipe entre páginas', const PageViewExemplo()),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('04 — Navegação')),
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
