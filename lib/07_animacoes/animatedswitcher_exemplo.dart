// =============================================================
// ANIMATEDSWITCHER — Transição (Fade) entre widgets diferentes
// =============================================================
import 'package:flutter/material.dart';

class AnimatedSwitcherExemplo extends StatefulWidget {
  const AnimatedSwitcherExemplo({super.key});

  @override
  State<AnimatedSwitcherExemplo> createState() => _AnimatedSwitcherExemploState();
}

class _AnimatedSwitcherExemploState extends State<AnimatedSwitcherExemplo> {
  int _contador = 0;
  bool _mostrarImagem = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedSwitcher')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Troca suavemente (Fade) entre 2 widgets.'),
            const SizedBox(height: 32),
            
            // --- Exemplo 1: Texto ---
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              // IMPORTANTE: Para o AnimatedSwitcher saber que é um widget "novo",
              // ele precisa ter uma Key diferente (se for do mesmo tipo).
              child: Text(
                '$_contador',
                key: ValueKey<int>(_contador), // Key garante a animação
                style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => setState(() => _contador++),
              child: const Text('Adicionar'),
            ),

            const SizedBox(height: 64),

            // --- Exemplo 2: Widgets totalmente diferentes ---
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 800),
              // TransitionBuilder opcional (o padrão é FadeTransition)
              transitionBuilder: (child, animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              // Não precisa de key aqui pois os TIPOS dos widgets são diferentes (Icon vs Image)
              child: _mostrarImagem 
                  ? Image.network('https://picsum.photos/150', width: 150, height: 150)
                  : const Icon(Icons.image_not_supported, size: 150, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => setState(() => _mostrarImagem = !_mostrarImagem),
              child: const Text('Trocar Widget'),
            ),
          ],
        ),
      ),
    );
  }
}
