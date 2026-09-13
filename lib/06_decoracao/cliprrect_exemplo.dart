// =============================================================
// CLIPRRECT & CORTES — Arredondando e cortando widgets
// =============================================================
import 'package:flutter/material.dart';

class ClipRRectExemplo extends StatelessWidget {
  const ClipRRectExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ClipRRect, ClipOval, ClipPath')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('A imagem original (retangular):', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Image.network('https://picsum.photos/200', width: 150, height: 150, fit: BoxFit.cover),

            const SizedBox(height: 32),

            // ----- CLIPRRECT -----
            const Text('ClipRRect (Rounded Rect):', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Arredonda as bordas de qualquer widget (muito usado com Imagens)'),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(30), // Bordas arredondadas
              child: Image.network('https://picsum.photos/200', width: 150, height: 150, fit: BoxFit.cover),
            ),

            const SizedBox(height: 32),

            // ----- CLIPOVAL -----
            const Text('ClipOval:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Transforma em círculo/oval'),
            const SizedBox(height: 8),
            ClipOval(
              child: Image.network('https://picsum.photos/200', width: 150, height: 150, fit: BoxFit.cover),
            ),

            const SizedBox(height: 32),

            // ----- CLIPPATH -----
            const Text('ClipPath:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Corte customizado desenhando com código (Path)'),
            const SizedBox(height: 8),
            ClipPath(
              clipper: _MeuCorteCustomizado(), // A classe que define o desenho
              child: Container(
                width: double.infinity,
                height: 150,
                color: Colors.indigo,
                alignment: Alignment.center,
                child: const Text('Corte Customizado!', style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Classe que define o desenho do ClipPath
class _MeuCorteCustomizado extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 40); // Linha esquerda até em baixo (menos 40px)
    // Curva até o lado direito
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 40);
    path.lineTo(size.width, 0); // Sobe linha direita
    path.close(); // Fecha o formato voltando à origem
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false; // Retorna true se a forma mudar dinamicamente
  }
}
