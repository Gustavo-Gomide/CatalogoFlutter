// =============================================================
// CUSTOMSCROLLVIEW + SLIVERS — Scroll avançado
// =============================================================
// CustomScrollView é o scroll mais flexível do Flutter.
// Ele usa "Slivers" — widgets especiais de scroll.
// Slivers mais comuns:
//   SliverAppBar    → AppBar que expande/contrai com scroll
//   SliverList      → Lista dentro do scroll
//   SliverGrid      → Grade dentro do scroll
//   SliverToBoxAdapter → Qualquer widget normal dentro do scroll
//   SliverPadding   → Padding dentro do scroll

import 'package:flutter/material.dart';

class CustomScrollViewExemplo extends StatelessWidget {
  const CustomScrollViewExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        // slivers — lista de widgets Sliver
        slivers: [
          // ----- SLIVERAPPBAR -----
          // AppBar que expande e contrai com o scroll
          SliverAppBar(
            // expandedHeight — altura quando expandido
            expandedHeight: 200,
            // floating — aparece imediatamente ao rolar para cima
            floating: false,
            // pinned — fica fixo no topo quando rolar
            pinned: true,
            // snap — com floating=true, faz snap para abrir/fechar
            snap: false,
            // flexibleSpace — conteúdo que expande/contrai
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('CustomScrollView'),
              // background — imagem ou widget de fundo
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.indigo, Colors.blue],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),

          // ----- SLIVERTOBOXADAPTER -----
          // Coloca um widget NORMAL dentro do scroll
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('SliverToBoxAdapter:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 8),
                  const Text('Coloca qualquer widget normal dentro do CustomScrollView'),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.amber.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: const Text('Widget normal aqui'),
                  ),
                ],
              ),
            ),
          ),

          // ----- SLIVERPADDING + SLIVERGRID -----
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.primaries[index % Colors.primaries.length].shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text('Grid $index'),
                  );
                },
                childCount: 6,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1.5,
              ),
            ),
          ),

          // ----- SLIVERLIST -----
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Text('SliverList:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,
                color: Colors.grey.shade800)),
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  leading: CircleAvatar(child: Text('${index + 1}')),
                  title: Text('Item da SliverList #$index'),
                  subtitle: const Text('Cada item é construído sob demanda (lazy)'),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
