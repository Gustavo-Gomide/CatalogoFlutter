// =============================================================
// IMAGE — Exibição de imagens
// =============================================================
import 'package:flutter/material.dart';

class ImagemExemplo extends StatelessWidget {
  const ImagemExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ----- IMAGE.NETWORK -----
            const Text('Image.network:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Carrega imagem da internet'),
            const SizedBox(height: 8),
            Image.network(
              'https://picsum.photos/300/200', // URL da imagem
              width: 300,
              height: 200,
              // fit — como a imagem se encaixa no espaço
              //   BoxFit.contain  → cabe inteira, pode ter espaço vazio
              //   BoxFit.cover    → preenche tudo, pode cortar
              //   BoxFit.fill     → estica para preencher (pode distorcer)
              //   BoxFit.fitWidth → preenche a largura
              //   BoxFit.fitHeight→ preenche a altura
              //   BoxFit.none     → tamanho original
              //   BoxFit.scaleDown→ como contain, mas nunca aumenta
              fit: BoxFit.cover,
              // loadingBuilder — widget enquanto carrega
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child; // Carregou!
                return SizedBox(
                  width: 300,
                  height: 200,
                  child: Center(
                    child: CircularProgressIndicator(
                      value: progress.expectedTotalBytes != null
                          ? progress.cumulativeBytesLoaded / progress.expectedTotalBytes!
                          : null,
                    ),
                  ),
                );
              },
              // errorBuilder — widget se der erro
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 300, height: 200,
                  color: Colors.grey.shade300,
                  alignment: Alignment.center,
                  child: const Icon(Icons.broken_image, size: 48),
                );
              },
            ),

            const SizedBox(height: 24),

            // ----- BOXFIT COMPARAÇÃO -----
            const Text('BoxFit comparação:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final fit in BoxFit.values)
                  Column(
                    children: [
                      Text('.${fit.name}', style: const TextStyle(fontSize: 10)),
                      Container(
                        width: 100,
                        height: 80,
                        color: Colors.grey.shade300,
                        child: Image.network(
                          'https://picsum.photos/200/300',
                          fit: fit,
                          errorBuilder: (context, error, stackTrace) =>
                              const Center(child: Icon(Icons.image, size: 24)),
                        ),
                      ),
                    ],
                  ),
              ],
            ),

            const SizedBox(height: 24),

            // ----- IMAGE.ASSET -----
            const Text('Image.asset:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Carrega imagem do projeto (pasta assets)'),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              color: Colors.grey.shade100,
              child: const Text(
                '// No pubspec.yaml:\n'
                '// flutter:\n'
                '//   assets:\n'
                '//     - assets/images/\n\n'
                '// No código:\n'
                '// Image.asset("assets/images/foto.png")',
                style: TextStyle(fontFamily: 'monospace', fontSize: 12),
              ),
            ),

            const SizedBox(height: 24),

            // ----- IMAGEM DECORADA -----
            const Text('Imagem com decoração:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            // ClipRRect para arredondar cantos
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://picsum.photos/300/150',
                width: 300,
                height: 150,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 300, height: 150, color: Colors.grey.shade300,
                  alignment: Alignment.center,
                  child: const Text('Imagem arredondada'),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Circular (avatar)
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://picsum.photos/100'),
            ),
          ],
        ),
      ),
    );
  }
}
