// =============================================================
// BOTTOMSHEET — Menu ou conteúdo deslizando de baixo
// =============================================================
import 'package:flutter/material.dart';

class BottomSheetExemplo extends StatelessWidget {
  const BottomSheetExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BottomSheet')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('ModalBottomSheet:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Sobrepõe a tela atual e escurece o fundo.'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Abre o BottomSheet modal
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true, // Permite que a sheet ocupe mais da metade da tela
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min, // Ocupa apenas o tamanho do conteúdo
                        children: [
                          Container(
                            width: 40, height: 4,
                            margin: const EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const Text('Opções de Compartilhamento', style: TextStyle(fontSize: 20)),
                          const SizedBox(height: 16),
                          ListTile(
                            leading: const Icon(Icons.copy),
                            title: const Text('Copiar Link'),
                            onTap: () => Navigator.pop(context), // Fecha a sheet
                          ),
                          ListTile(
                            leading: const Icon(Icons.share),
                            title: const Text('Compartilhar'),
                            onTap: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Text('Abrir ModalBottomSheet'),
            ),
          ],
        ),
      ),
    );
  }
}
