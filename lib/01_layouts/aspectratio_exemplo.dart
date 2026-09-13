// =============================================================
// ASPECTRATIO — Mantém proporção fixa de largura/altura
// =============================================================
// AspectRatio força o filho a manter uma proporção.
// Útil para vídeos (16:9), imagens quadradas (1:1), etc.

import 'package:flutter/material.dart';

class AspectRatioExemplo extends StatelessWidget {
  const AspectRatioExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AspectRatio')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('AspectRatio:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Mantém a proporção largura/altura do filho'),
            const SizedBox(height: 16),

            // aspectRatio = largura / altura
            //   16/9 = widescreen (vídeo)
            //   1.0  = quadrado
            //   3/4  = retrato vertical

            // ----- 16:9 -----
            const Text('16:9 (widescreen):'),
            const SizedBox(height: 4),
            AspectRatio(
              aspectRatio: 16 / 9, // largura / altura
              child: Container(
                color: Colors.blue.shade200,
                alignment: Alignment.center,
                child: const Text('16:9', style: TextStyle(fontSize: 24)),
              ),
            ),

            const SizedBox(height: 24),

            // ----- 1:1 -----
            const Text('1:1 (quadrado):'),
            const SizedBox(height: 4),
            SizedBox(
              width: 150, // Limitando largura
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  color: Colors.green.shade200,
                  alignment: Alignment.center,
                  child: const Text('1:1', style: TextStyle(fontSize: 24)),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ----- 4:3 -----
            const Text('4:3 (TV clássica):'),
            const SizedBox(height: 4),
            AspectRatio(
              aspectRatio: 4 / 3,
              child: Container(
                color: Colors.orange.shade200,
                alignment: Alignment.center,
                child: const Text('4:3', style: TextStyle(fontSize: 24)),
              ),
            ),

            const SizedBox(height: 24),

            // ----- Na prática: galeria -----
            const Text('Na prática — galeria com proporção:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                childAspectRatio: 1.0, // Itens quadrados
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.primaries[index % Colors.primaries.length].shade200,
                  alignment: Alignment.center,
                  child: Text('${index + 1}'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
