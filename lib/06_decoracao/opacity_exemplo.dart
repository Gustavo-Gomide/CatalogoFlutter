// =============================================================
// OPACITY & ANIMATEDOPACITY — Transparência
// =============================================================
import 'package:flutter/material.dart';

class OpacityExemplo extends StatefulWidget {
  const OpacityExemplo({super.key});

  @override
  State<OpacityExemplo> createState() => _OpacityExemploState();
}

class _OpacityExemploState extends State<OpacityExemplo> {
  double _opacidade = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Opacity')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Opacity Estática:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('0.0 (invisível) a 1.0 (totalmente visível)'),
            const SizedBox(height: 16),
            
            // Opacity estática
            const Opacity(
              opacity: 0.5, // 50% transparente
              child: Icon(Icons.favorite, size: 80, color: Colors.red),
            ),

            const SizedBox(height: 48),

            const Text('AnimatedOpacity:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Anima automaticamente a mudança.'),
            const SizedBox(height: 16),
            
            // Opacity animada
            AnimatedOpacity(
              opacity: _opacidade,
              duration: const Duration(seconds: 1), // Tempo da animação
              curve: Curves.easeInOut, // Tipo de animação
              child: Container(
                width: 150, height: 150,
                color: Colors.indigo,
                alignment: Alignment.center,
                child: const Text('Sou um fantasma', style: TextStyle(color: Colors.white)),
              ),
            ),

            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => _opacidade = 0.0), // Some
                  child: const Text('Desaparecer'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () => setState(() => _opacidade = 1.0), // Aparece
                  child: const Text('Aparecer'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
