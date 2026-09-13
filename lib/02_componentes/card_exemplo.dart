// =============================================================
// CARD — Cartão com sombra e conteúdo
// =============================================================
import 'package:flutter/material.dart';

class CardExemplo extends StatelessWidget {
  const CardExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Card')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Card básico:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Card(
              // elevation — intensidade da sombra (0 = sem sombra)
              elevation: 4,
              // shape — forma do card
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              // color — cor de fundo
              // shadowColor — cor da sombra
              // margin — espaço externo
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Text('Um card simples com sombra'),
              ),
            ),

            const SizedBox(height: 16),

            // ----- CARD COMPLETO (como em apps reais) -----
            const Text('Card completo:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Card(
              clipBehavior: Clip.antiAlias, // Recorta o conteúdo nos cantos
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Imagem no topo
                  Container(
                    height: 150,
                    width: double.infinity,
                    color: Colors.indigo.shade200,
                    alignment: Alignment.center,
                    child: const Icon(Icons.image, size: 48, color: Colors.white),
                  ),
                  // Conteúdo
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Título do Card', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        Text('Descrição do card com texto explicativo sobre o conteúdo.'),
                      ],
                    ),
                  ),
                  // Ações
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        TextButton(onPressed: () {}, child: const Text('AÇÃO 1')),
                        TextButton(onPressed: () {}, child: const Text('AÇÃO 2')),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ----- CARD OUTLINED -----
            const Text('Card.outlined (sem sombra):', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Card.outlined(
              child: ListTile(
                leading: const Icon(Icons.info),
                title: const Text('Card com borda'),
                subtitle: const Text('Sem sombra, só borda'),
                trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
              ),
            ),

            const SizedBox(height: 16),

            // ----- CARD FILLED -----
            const Text('Card.filled:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Card.filled(
              child: ListTile(
                leading: const Icon(Icons.palette),
                title: const Text('Card preenchido'),
                subtitle: const Text('Cor de fundo do tema'),
                trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.chevron_right)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
