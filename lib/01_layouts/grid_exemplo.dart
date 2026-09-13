// =============================================================
// GRIDVIEW — Grade de itens (como galeria de fotos)
// =============================================================
// GridView organiza filhos em uma grade bidimensional.
// Existem vários construtores:
//   GridView.count    → define número fixo de colunas
//   GridView.extent   → define largura máxima de cada item
//   GridView.builder  → lazy (cria itens sob demanda — melhor performance)
//   GridView.custom   → controle total

import 'package:flutter/material.dart';

class GridExemplo extends StatelessWidget {
  const GridExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GridView')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ----- GRIDVIEW.COUNT -----
            const Text('GridView.count — 3 colunas:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SizedBox(
              height: 250,
              child: GridView.count(
                // crossAxisCount — número de colunas
                crossAxisCount: 3,
                // mainAxisSpacing — espaço vertical entre itens
                mainAxisSpacing: 8,
                // crossAxisSpacing — espaço horizontal entre itens
                crossAxisSpacing: 8,
                // childAspectRatio — proporção largura/altura de cada item
                //   1.0 = quadrado, 2.0 = duas vezes mais largo que alto
                childAspectRatio: 1.0,
                // padding — espaçamento ao redor da grade
                padding: const EdgeInsets.all(4),
                children: [
                  for (int i = 1; i <= 9; i++)
                    Container(
                      color: Colors.primaries[i % Colors.primaries.length],
                      alignment: Alignment.center,
                      child: Text('$i', style: const TextStyle(color: Colors.white, fontSize: 24)),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ----- GRIDVIEW.EXTENT -----
            const Text('GridView.extent — maxExtent: 100:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Define a largura máxima de cada item (o número de colunas é calculado)'),
            const SizedBox(height: 8),
            SizedBox(
              height: 250,
              child: GridView.extent(
                // maxCrossAxisExtent — largura máxima de cada item
                maxCrossAxisExtent: 100,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: [
                  for (int i = 1; i <= 12; i++)
                    Container(
                      color: Colors.teal.shade200,
                      alignment: Alignment.center,
                      child: Text('$i'),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ----- GRIDVIEW.BUILDER -----
            const Text('GridView.builder — lazy loading:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Cria itens sob demanda (melhor para listas grandes)'),
            const SizedBox(height: 8),
            SizedBox(
              height: 300,
              child: GridView.builder(
                // gridDelegate — controla o layout da grade
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,        // 2 colunas
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.5,     // retangular
                ),
                itemCount: 20, // Total de itens
                itemBuilder: (context, index) {
                  // Só constrói quando o item aparece na tela
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text('Item $index', style: const TextStyle(fontWeight: FontWeight.bold)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
