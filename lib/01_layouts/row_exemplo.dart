// =============================================================
// ROW — Organiza filhos em LINHA HORIZONTAL
// =============================================================
// Row é um dos widgets mais usados. Coloca seus filhos lado a lado.
// O eixo PRINCIPAL (main) é o HORIZONTAL.
// O eixo CRUZADO (cross) é o VERTICAL.

import 'package:flutter/material.dart';

class RowExemplo extends StatelessWidget {
  const RowExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Row')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ----- ROW BÁSICA -----
            const Text('Row básica:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              // mainAxisAlignment — como distribuir no eixo horizontal
              //   .start     → empurra tudo para a esquerda (padrão)
              //   .center    → centraliza
              //   .end       → empurra tudo para a direita
              //   .spaceBetween → espaço igual ENTRE os filhos
              //   .spaceAround  → espaço ao REDOR de cada filho
              //   .spaceEvenly  → espaço IGUAL entre todos (incluindo bordas)
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              // crossAxisAlignment — como alinhar no eixo vertical
              //   .start    → alinha no topo
              //   .center   → centraliza verticalmente (padrão)
              //   .end      → alinha na parte inferior
              //   .stretch  → estica para ocupar toda a altura
              crossAxisAlignment: CrossAxisAlignment.center,

              // mainAxisSize — quanto espaço a Row ocupa no eixo horizontal
              //   .max → ocupa toda a largura disponível (padrão)
              //   .min → ocupa apenas o necessário
              mainAxisSize: MainAxisSize.max,

              children: [
                _caixa('A', Colors.red),
                _caixa('B', Colors.green),
                _caixa('C', Colors.blue),
              ],
            ),

            const SizedBox(height: 24),

            // ----- MAIN AXIS ALIGNMENT COMPARAÇÃO -----
            const Text('MainAxisAlignment:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            for (final align in MainAxisAlignment.values) ...[
              Text('  .${align.name}', style: const TextStyle(fontSize: 12)),
              Container(
                color: Colors.grey.shade200,
                child: Row(
                  mainAxisAlignment: align,
                  children: [
                    _caixaPequena(Colors.red),
                    _caixaPequena(Colors.green),
                    _caixaPequena(Colors.blue),
                  ],
                ),
              ),
              const SizedBox(height: 8),
            ],

            const SizedBox(height: 24),

            // ----- CROSS AXIS ALIGNMENT -----
            const Text('CrossAxisAlignment:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            for (final align in [
              CrossAxisAlignment.start,
              CrossAxisAlignment.center,
              CrossAxisAlignment.end,
              CrossAxisAlignment.stretch,
            ]) ...[
              Text('  .${align.name}', style: const TextStyle(fontSize: 12)),
              Container(
                height: 80,
                color: Colors.grey.shade200,
                child: Row(
                  crossAxisAlignment: align,
                  children: [
                    _caixa('Alto', Colors.orange, height: 60),
                    _caixa('Médio', Colors.purple, height: 40),
                    _caixa('Baixo', Colors.teal, height: 20),
                  ],
                ),
              ),
              const SizedBox(height: 8),
            ],
          ],
        ),
      ),
    );
  }

  // Helpers
  static Widget _caixa(String texto, Color cor, {double? height}) {
    return Container(
      width: 60,
      height: height ?? 50,
      color: cor,
      alignment: Alignment.center,
      child: Text(texto, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }

  static Widget _caixaPequena(Color cor) {
    return Container(width: 40, height: 40, color: cor);
  }
}
