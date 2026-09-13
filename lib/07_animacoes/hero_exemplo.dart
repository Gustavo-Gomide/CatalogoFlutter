// =============================================================
// HERO — Animação de transição de elementos entre telas
// =============================================================
import 'package:flutter/material.dart';

class HeroExemplo extends StatelessWidget {
  const HeroExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero (Transição)')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('O widget Hero permite que um elemento "voe" de uma tela para outra.'),
            const SizedBox(height: 32),
            
            // Um card clicável que vai para outra tela
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const DetalheHeroTela()));
              },
              // Envolva o widget no Hero e dê uma tag única
              child: Hero(
                tag: 'foto-perfil-hero', // Mesma tag na tela de destino!
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    'https://picsum.photos/100',
                    width: 100, height: 100, fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Text('Toque na imagem'),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------
// Tela de Destino
// -----------------------------------------------------------------
class DetalheHeroTela extends StatelessWidget {
  const DetalheHeroTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes')),
      body: Column(
        children: [
          // Na tela de destino, usamos o Hero com a MESMA TAG
          Hero(
            tag: 'foto-perfil-hero', // Mesma tag!
            child: Image.network(
              'https://picsum.photos/100', // Mesma imagem
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover, // Ela vai crescer de 100x100 para a tela toda!
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'A imagem "voou" da tela anterior para esta. Volte para ver ela voltando.',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
