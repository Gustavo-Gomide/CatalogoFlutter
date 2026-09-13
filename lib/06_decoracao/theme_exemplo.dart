// =============================================================
// THEME — Usando as cores e estilos do sistema
// =============================================================
import 'package:flutter/material.dart';

class ThemeExemplo extends StatelessWidget {
  const ThemeExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    // Acessando os temas
    final temaDaTela = Theme.of(context);
    final cores = temaDaTela.colorScheme;
    final textos = temaDaTela.textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Theme / ThemeData')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'O Flutter usa o ThemeData (definido no main.dart) para '
              'padronizar cores e fontes.\nVocê pode acessá-lo usando Theme.of(context).',
            ),
            const SizedBox(height: 24),

            Text('Cores do ColorScheme:', style: textos.titleLarge),
            const SizedBox(height: 8),
            
            // Usando cores do tema
            Container(
              padding: const EdgeInsets.all(16),
              color: cores.primaryContainer,
              child: Text('primaryContainer', style: TextStyle(color: cores.onPrimaryContainer)),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              color: cores.secondaryContainer,
              child: Text('secondaryContainer', style: TextStyle(color: cores.onSecondaryContainer)),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              color: cores.errorContainer,
              child: Text('errorContainer', style: TextStyle(color: cores.onErrorContainer)),
            ),

            const SizedBox(height: 32),

            Text('TextTheme (Tipografia):', style: textos.titleLarge),
            const SizedBox(height: 8),
            
            // Usando estilos de texto do tema
            Text('displayMedium', style: textos.displayMedium),
            Text('headlineSmall', style: textos.headlineSmall),
            Text('titleMedium', style: textos.titleMedium),
            Text('bodyLarge (texto padrão)', style: textos.bodyLarge),
            Text('labelSmall', style: textos.labelSmall),

            const SizedBox(height: 32),

            // Mudando o tema localmente (apenas para essa parte da árvore)
            Text('Theme local customizado:', style: textos.titleLarge),
            const SizedBox(height: 8),
            Theme(
              // Pega o tema atual e sobrescreve algumas coisas
              data: temaDaTela.copyWith(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
              ),
              child: Builder(
                builder: (contextLocal) {
                  // Precisamos do Builder para o botão enxergar o novo Theme
                  return ElevatedButton(
                    onPressed: () {},
                    child: const Text('Botão Verde (mesmo o app sendo indigo)'),
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
