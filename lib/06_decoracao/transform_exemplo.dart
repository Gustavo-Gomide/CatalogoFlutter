// =============================================================
// TRANSFORM — Rotação, escala e translação de widgets
// =============================================================
import 'package:flutter/material.dart';
import 'dart:math'; // Necessário para usar 'pi'

class TransformExemplo extends StatelessWidget {
  const TransformExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transform')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const Text('O Transform muda o visual, mas não afeta o layout real (o espaço original é mantido).', textAlign: TextAlign.center),
            const SizedBox(height: 48),

            // ----- ROTAÇÃO -----
            const Text('Transform.rotate:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Transform.rotate(
              angle: pi / 4, // Rotação em radianos (pi/4 = 45 graus)
              child: Container(
                width: 100, height: 100, color: Colors.blue,
                child: const Center(child: Text('Rotacionado', style: TextStyle(color: Colors.white))),
              ),
            ),

            const SizedBox(height: 64),

            // ----- ESCALA -----
            const Text('Transform.scale:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Transform.scale(
              scale: 1.5, // 1.5x maior
              child: Container(
                width: 100, height: 50, color: Colors.green,
                child: const Center(child: Text('Maior', style: TextStyle(color: Colors.white))),
              ),
            ),

            const SizedBox(height: 64),

            // ----- TRANSLATE -----
            const Text('Transform.translate:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Transform.translate(
              offset: const Offset(30, 0), // Move 30px pra direita, 0 pra baixo
              child: Container(
                width: 100, height: 50, color: Colors.orange,
                child: const Center(child: Text('Movido ->', style: TextStyle(color: Colors.white))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
