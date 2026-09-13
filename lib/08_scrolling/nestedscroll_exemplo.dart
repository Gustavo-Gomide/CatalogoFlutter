// =============================================================
// NESTEDSCROLLVIEW — Scroll complexo (Slivers com listas)
// =============================================================
import 'package:flutter/material.dart';

class NestedScrollExemplo extends StatelessWidget {
  const NestedScrollExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Em vez de AppBar aqui, usamos o NestedScrollView
      body: NestedScrollView(
        // O headerSliverBuilder constrói a parte superior que reage ao scroll
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: const Text('NestedScrollView'),
              expandedHeight: 200.0, // Altura quando expandido
              floating: false,       // Se a barra volta a aparecer quando rola pra cima
              pinned: true,          // Mantém a barra fixa no topo quando encolhe
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  'https://picsum.photos/500/200',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        // O corpo é a lista que rola "por baixo" do SliverAppBar
        body: ListView.builder(
          itemCount: 30,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.star),
              title: Text('Item $index na lista interna'),
            );
          },
        ),
      ),
    );
  }
}
