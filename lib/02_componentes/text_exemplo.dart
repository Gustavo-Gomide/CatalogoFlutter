// =============================================================
// TEXT, RICHTEXT, SELECTABLETEXT — Exibição de texto
// =============================================================
import 'package:flutter/material.dart';

class TextExemplo extends StatelessWidget {
  const TextExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text / RichText')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ----- TEXT BÁSICO -----
            const Text('Text básico:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Olá, Flutter!'),

            const SizedBox(height: 16),

            // ----- TEXT COM STYLE -----
            const Text('Text com TextStyle:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text(
              'Texto estilizado',
              style: TextStyle(
                fontSize: 24,               // tamanho da fonte
                fontWeight: FontWeight.bold,  // peso: .w100 a .w900, .bold
                fontStyle: FontStyle.italic,  // itálico
                color: Colors.indigo,         // cor do texto
                letterSpacing: 2.0,           // espaço entre letras
                wordSpacing: 5.0,             // espaço entre palavras
                height: 1.5,                  // altura da linha (multiplicador)
                // decoration — sublinhado, tachado, etc.
                decoration: TextDecoration.underline,
                decorationColor: Colors.red,
                decorationStyle: TextDecorationStyle.wavy,
                // fontFamily: 'Roboto',      // fonte customizada
                // shadows: [Shadow(...)],     // sombra no texto
              ),
            ),

            const SizedBox(height: 16),

            // ----- TEXT PROPRIEDADES -----
            const Text('Propriedades do Text:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text(
              'Este é um texto longo que vai demonstrar as propriedades de overflow, '
              'maxLines e textAlign do widget Text no Flutter.',
              // textAlign — alinhamento do texto
              //   TextAlign.left (padrão), .center, .right, .justify
              textAlign: TextAlign.justify,
              // maxLines — número máximo de linhas
              maxLines: 2,
              // overflow — o que fazer quando o texto é maior que o espaço
              //   TextOverflow.clip     → corta
              //   TextOverflow.fade     → desbota
              //   TextOverflow.ellipsis → adiciona "..."
              //   TextOverflow.visible  → mostra tudo (pode vazar)
              overflow: TextOverflow.ellipsis,
              // textScaler — escala do texto
              // softWrap — se deve quebrar linha (true padrão)
            ),

            const SizedBox(height: 24),

            // ----- RICHTEXT / Text.rich -----
            const Text('Text.rich (RichText):', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Permite ESTILOS DIFERENTES na mesma linha'),
            const SizedBox(height: 8),
            Text.rich(
              TextSpan(
                text: 'Este texto é ',
                style: const TextStyle(fontSize: 16),
                // children — lista de TextSpan com estilos diferentes
                children: [
                  const TextSpan(
                    text: 'negrito',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(text: ', '),
                  TextSpan(
                    text: 'colorido',
                    style: TextStyle(color: Colors.blue.shade700),
                  ),
                  const TextSpan(text: ' e '),
                  const TextSpan(
                    text: 'grande',
                    style: TextStyle(fontSize: 24, color: Colors.red),
                  ),
                  const TextSpan(text: '.'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ----- SELECTABLETEXT -----
            const Text('SelectableText:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Texto que o usuário pode selecionar e copiar'),
            const SizedBox(height: 8),
            const SelectableText(
              'Toque e segure para selecionar este texto! '
              'Você pode copiar com o menu de contexto.',
              style: TextStyle(fontSize: 16, color: Colors.teal),
            ),

            const SizedBox(height: 24),

            // ----- USANDO TEMA -----
            const Text('Usando estilos do Tema:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            // Theme.of(context).textTheme dá acesso aos estilos padrão
            Text('displayLarge', style: Theme.of(context).textTheme.displayLarge),
            Text('headlineMedium', style: Theme.of(context).textTheme.headlineMedium),
            Text('titleLarge', style: Theme.of(context).textTheme.titleLarge),
            Text('bodyLarge', style: Theme.of(context).textTheme.bodyLarge),
            Text('bodyMedium', style: Theme.of(context).textTheme.bodyMedium),
            Text('labelSmall', style: Theme.of(context).textTheme.labelSmall),
          ],
        ),
      ),
    );
  }
}
