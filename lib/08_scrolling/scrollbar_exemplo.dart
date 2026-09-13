// =============================================================
// SCROLLBAR — Barra de rolagem visível
// =============================================================
import 'package:flutter/material.dart';

class ScrollbarExemplo extends StatelessWidget {
  const ScrollbarExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    // ScrollController é frequentemente usado para rastrear a posição 
    // do scroll e linkar com a Scrollbar (embora seja opcional no Desktop/Web 
    // dependendo da configuração do Flutter).
    final ScrollController controlador = ScrollController();

    return Scaffold(
      appBar: AppBar(title: const Text('Scrollbar')),
      body: Scrollbar(
        controller: controlador,
        thumbVisibility: true, // Mostra a barra de rolagem sempre (mesmo sem rolar)
        thickness: 8,          // Espessura da barra
        radius: const Radius.circular(10), // Bordas da barra
        interactive: true,     // Permite clicar e arrastar a barra
        child: ListView.builder(
          controller: controlador, // O controller deve ser o mesmo do Scrollbar!
          itemCount: 100,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Item longo número $index'),
            );
          },
        ),
      ),
    );
  }
}
