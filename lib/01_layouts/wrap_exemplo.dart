// =============================================================
// WRAP — Quebra de linha automática
// =============================================================
// Wrap funciona como Row/Column mas QUEBRA a linha quando não cabe.
// Perfeito para tags, chips, botões de filtro, etc.

import 'package:flutter/material.dart';

class WrapExemplo extends StatelessWidget {
  const WrapExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wrap')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ----- WRAP HORIZONTAL (padrão) -----
            const Text('Wrap horizontal (padrão):', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              // direction — eixo principal
              //   Axis.horizontal (padrão) — itens lado a lado, quebra para baixo
              //   Axis.vertical — itens em coluna, quebra para a direita
              direction: Axis.horizontal,

              // spacing — espaço ENTRE os filhos no eixo principal
              spacing: 8,

              // runSpacing — espaço entre as LINHAS (ou colunas, se vertical)
              runSpacing: 8,

              // alignment — alinhamento dos filhos dentro de cada linha
              //   WrapAlignment.start (padrão), .center, .end
              //   .spaceBetween, .spaceAround, .spaceEvenly
              alignment: WrapAlignment.start,

              // runAlignment — alinhamento das linhas entre si
              runAlignment: WrapAlignment.start,

              // crossAxisAlignment — alinhamento no eixo cruzado
              //   WrapCrossAlignment.start, .center, .end
              crossAxisAlignment: WrapCrossAlignment.start,

              children: [
                for (final tag in [
                  'Flutter', 'Dart', 'Mobile', 'Web', 'Desktop',
                  'Android', 'iOS', 'Windows', 'macOS', 'Linux',
                  'Material Design', 'Cupertino', 'Widget',
                ])
                  Chip(label: Text(tag)),
              ],
            ),

            const SizedBox(height: 24),

            // ----- WRAP VERTICAL -----
            const Text('Wrap vertical:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SizedBox(
              height: 150, // Precisa de altura limitada para quebrar
              child: Wrap(
                direction: Axis.vertical, // Itens em coluna
                spacing: 8,
                runSpacing: 12,
                children: [
                  for (int i = 1; i <= 10; i++)
                    Container(
                      width: 50,
                      height: 30,
                      color: Colors.primaries[i % Colors.primaries.length],
                      alignment: Alignment.center,
                      child: Text('$i', style: const TextStyle(color: Colors.white)),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ----- WRAP COM ALIGNMENT -----
            const Text('WrapAlignment.spaceEvenly:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              color: Colors.grey.shade200,
              child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (int i = 0; i < 7; i++)
                    Container(width: 70, height: 40, color: Colors.indigo.shade200),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
