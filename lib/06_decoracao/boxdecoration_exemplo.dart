// =============================================================
// BOXDECORATION — Estilizando fundos e bordas (usado no Container)
// =============================================================
import 'package:flutter/material.dart';

class BoxDecorationExemplo extends StatelessWidget {
  const BoxDecorationExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BoxDecoration')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('Container básico sem decoração:'),
            const SizedBox(height: 8),
            Container(
              width: 150, height: 150,
              color: Colors.blue, // Usar color fora da decoration
            ),
            
            const SizedBox(height: 32),

            const Text('BoxDecoration Completo:'),
            const SizedBox(height: 8),
            Container(
              width: 250, height: 150,
              // IMPORTANTE: Quando usar decoration, a cor deve ficar DENTRO dele!
              decoration: BoxDecoration(
                // 1. Cor de fundo
                color: Colors.white,
                
                // 2. Bordas arredondadas
                borderRadius: BorderRadius.circular(20),
                
                // 3. Borda (linha em volta)
                border: Border.all(
                  color: Colors.indigo,
                  width: 3,
                ),
                
                // 4. Sombras (pode ser uma lista com várias)
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3), // Cor com transparência
                    spreadRadius: 2,  // O quanto a sombra se espalha
                    blurRadius: 10,   // O quanto a sombra é borrada (suavizada)
                    offset: const Offset(5, 5), // Deslocamento (x, y)
                  ),
                ],
                
                // 5. Gradiente (Linear, Radial ou Sweep)
                gradient: const LinearGradient(
                  colors: [Colors.indigo, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                
                // 6. Imagem de fundo
                // image: DecorationImage(
                //   image: NetworkImage('...'),
                //   fit: BoxFit.cover,
                // ),
              ),
              child: const Center(
                child: Text('BoxDecoration', 
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
              ),
            ),

            const SizedBox(height: 32),

            const Text('Formato circular (BoxShape.circle):'),
            const SizedBox(height: 8),
            Container(
              width: 100, height: 100,
              decoration: const BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.circle, // Arredonda perfeitamente sem precisar de borderRadius
                boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black26)],
              ),
              child: const Icon(Icons.star, size: 50, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
