// =============================================================
// ANIMATEDCONTAINER — Animação implícita de propriedades
// =============================================================
import 'package:flutter/material.dart';

class AnimatedContainerExemplo extends StatefulWidget {
  const AnimatedContainerExemplo({super.key});

  @override
  State<AnimatedContainerExemplo> createState() => _AnimatedContainerExemploState();
}

class _AnimatedContainerExemploState extends State<AnimatedContainerExemplo> {
  // Variáveis que vão mudar e causar a animação
  bool _expandido = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedContainer')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'O AnimatedContainer anima automaticamente QUALQUER\n'
              'mudança nas suas propriedades (tamanho, cor, borda...)',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),

            // O widget mágico!
            AnimatedContainer(
              // Duração obrigatória
              duration: const Duration(seconds: 1),
              // Curva da animação (opcional, deixa mais natural)
              curve: Curves.fastOutSlowIn,
              
              // Propriedades que dependem do estado (_expandido)
              width: _expandido ? 250 : 100,
              height: _expandido ? 250 : 100,
              decoration: BoxDecoration(
                color: _expandido ? Colors.indigo : Colors.orange,
                borderRadius: _expandido ? BorderRadius.circular(20) : BorderRadius.circular(50),
              ),
              alignment: _expandido ? Alignment.center : Alignment.bottomCenter,
              
              child: const Icon(Icons.star, color: Colors.white, size: 50),
            ),

            const SizedBox(height: 48),

            ElevatedButton(
              onPressed: () {
                // Ao mudar o estado, o Flutter reconstrói a tela
                // e o AnimatedContainer interpola do valor antigo pro novo!
                setState(() => _expandido = !_expandido);
              },
              child: const Text('Animar!'),
            ),
          ],
        ),
      ),
    );
  }
}
