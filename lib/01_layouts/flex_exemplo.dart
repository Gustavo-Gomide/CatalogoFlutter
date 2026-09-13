// =============================================================
// EXPANDED, FLEXIBLE, SPACER — Distribuição de espaço
// =============================================================
// Esses widgets controlam como o espaço é dividido dentro de Row/Column.
//   Expanded  → OBRIGA o filho a ocupar todo o espaço disponível
//   Flexible  → PERMITE (mas não obriga) o filho a crescer
//   Spacer    → Espaço vazio que se expande

import 'package:flutter/material.dart';

class FlexExemplo extends StatelessWidget {
  const FlexExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expanded / Flexible / Spacer')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ----- EXPANDED -----
            const Text('Expanded:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Força o filho a preencher todo o espaço restante'),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(width: 60, height: 50, color: Colors.red), // Tamanho fixo
                // Expanded ocupa todo o espaço restante
                Expanded(
                  child: Container(height: 50, color: Colors.green),
                ),
                Container(width: 60, height: 50, color: Colors.blue), // Tamanho fixo
              ],
            ),

            const SizedBox(height: 16),

            // ----- EXPANDED COM FLEX (peso) -----
            const Text('Expanded com flex (peso):', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('flex: 2 ocupa o dobro de flex: 1'),
            const SizedBox(height: 8),
            Row(
              children: [
                // flex — peso proporcional (padrão é 1)
                Expanded(
                  flex: 1, // 1 parte
                  child: Container(height: 50, color: Colors.red, alignment: Alignment.center,
                    child: const Text('flex:1', style: TextStyle(color: Colors.white))),
                ),
                Expanded(
                  flex: 2, // 2 partes (o dobro)
                  child: Container(height: 50, color: Colors.green, alignment: Alignment.center,
                    child: const Text('flex:2', style: TextStyle(color: Colors.white))),
                ),
                Expanded(
                  flex: 1, // 1 parte
                  child: Container(height: 50, color: Colors.blue, alignment: Alignment.center,
                    child: const Text('flex:1', style: TextStyle(color: Colors.white))),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // ----- FLEXIBLE -----
            const Text('Flexible:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Permite crescer, mas NÃO obriga (diferença do Expanded)'),
            const SizedBox(height: 8),
            Row(
              children: [
                // fit — como o filho deve ocupar o espaço
                //   FlexFit.tight   → OBRIGA a preencher (= Expanded)
                //   FlexFit.loose   → PERMITE crescer ATÉ o espaço, mas pode ser menor (padrão)
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose, // Pode ser menor que o espaço
                  child: Container(
                    width: 80, // Quer ser 80px, e pode
                    height: 50,
                    color: Colors.orange,
                    alignment: Alignment.center,
                    child: const Text('loose', style: TextStyle(color: Colors.white)),
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight, // Forçado a preencher (= Expanded)
                  child: Container(
                    height: 50,
                    color: Colors.purple,
                    alignment: Alignment.center,
                    child: const Text('tight', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // ----- SPACER -----
            const Text('Spacer:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Espaço vazio flexível — empurra widgets para os lados'),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('Esquerda'),
                // Spacer é basicamente um Expanded(child: SizedBox())
                const Spacer(), // Empurra tudo para os lados
                const Text('Centro'),
                const Spacer(flex: 2), // Pode ter flex/peso também
                const Text('Direita'),
              ],
            ),

            const SizedBox(height: 24),

            // ----- RESUMO VISUAL -----
            const Text('Resumo visual:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            _exemplo('Sem Expanded/Flexible:', [
              Container(width: 60, height: 40, color: Colors.red),
              Container(width: 60, height: 40, color: Colors.blue),
            ]),
            const SizedBox(height: 8),
            _exemplo('Com Expanded no meio:', [
              Container(width: 60, height: 40, color: Colors.red),
              Expanded(child: Container(height: 40, color: Colors.green.shade200)),
              Container(width: 60, height: 40, color: Colors.blue),
            ]),
            const SizedBox(height: 8),
            _exemplo('Todos Expanded:', [
              Expanded(child: Container(height: 40, color: Colors.red)),
              Expanded(child: Container(height: 40, color: Colors.green)),
              Expanded(child: Container(height: 40, color: Colors.blue)),
            ]),
          ],
        ),
      ),
    );
  }

  static Widget _exemplo(String titulo, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titulo, style: const TextStyle(fontSize: 12)),
        Container(
          color: Colors.grey.shade200,
          child: Row(children: children),
        ),
      ],
    );
  }
}
