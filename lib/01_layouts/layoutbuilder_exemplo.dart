// =============================================================
// LAYOUTBUILDER — Layout RESPONSIVO
// =============================================================
// LayoutBuilder informa o tamanho disponível (constraints) do pai.
// Você pode usar para mudar o layout baseado na largura/altura.
// É a BASE do layout responsivo no Flutter.

import 'package:flutter/material.dart';

class LayoutBuilderExemplo extends StatelessWidget {
  const LayoutBuilderExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LayoutBuilder')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('LayoutBuilder:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Muda o layout baseado no espaço disponível'),
            const SizedBox(height: 16),

            // ----- LAYOUTBUILDER BÁSICO -----
            LayoutBuilder(
              // builder recebe (context, constraints)
              // constraints.maxWidth — largura máxima disponível
              // constraints.maxHeight — altura máxima disponível
              // constraints.minWidth / minHeight — mínimos
              builder: (context, constraints) {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  color: Colors.blue.shade100,
                  child: Text(
                    'Largura disponível: ${constraints.maxWidth.toStringAsFixed(0)}px\n'
                    'Altura máx: ${constraints.maxHeight == double.infinity ? "infinita" : constraints.maxHeight.toStringAsFixed(0)}',
                  ),
                );
              },
            ),

            const SizedBox(height: 24),

            // ----- LAYOUT RESPONSIVO -----
            const Text('Layout responsivo:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Se largura > 600 → Row (lado a lado)\nSe largura ≤ 600 → Column (empilhado)'),
            const SizedBox(height: 8),

            LayoutBuilder(
              builder: (context, constraints) {
                // Decisão baseada na largura
                if (constraints.maxWidth > 600) {
                  // TELA GRANDE → lado a lado
                  return Row(
                    children: [
                      Expanded(child: _card('Painel A', Colors.indigo.shade100)),
                      const SizedBox(width: 12),
                      Expanded(child: _card('Painel B', Colors.teal.shade100)),
                    ],
                  );
                } else {
                  // TELA PEQUENA → empilhado
                  return Column(
                    children: [
                      _card('Painel A', Colors.indigo.shade100),
                      const SizedBox(height: 12),
                      _card('Painel B', Colors.teal.shade100),
                    ],
                  );
                }
              },
            ),

            const SizedBox(height: 24),

            // ----- MEDIAQUERY (alternativa) -----
            const Text('MediaQuery (alternativa):', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Pega informações da TELA (não do widget pai)'),
            const SizedBox(height: 8),
            Builder(
              builder: (context) {
                // MediaQuery dá informações sobre a TELA INTEIRA
                final media = MediaQuery.of(context);
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  color: Colors.green.shade100,
                  child: Text(
                    'Largura da tela: ${media.size.width.toStringAsFixed(0)}px\n'
                    'Altura da tela: ${media.size.height.toStringAsFixed(0)}px\n'
                    'Orientação: ${media.orientation.name}\n'
                    'Padding do topo (status bar): ${media.padding.top}px\n'
                    'devicePixelRatio: ${media.devicePixelRatio}',
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  static Widget _card(String texto, Color cor) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(texto, style: const TextStyle(fontSize: 18)),
    );
  }
}
