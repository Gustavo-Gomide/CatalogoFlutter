// =============================================================
// MATERIALBANNER — Banner de aviso no topo da tela
// =============================================================
import 'package:flutter/material.dart';

class BannerExemplo extends StatelessWidget {
  const BannerExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MaterialBanner')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Banners são mensagens importantes e persistentes.\n'
              'Eles ficam na tela até o usuário dispensar.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Esconde banner ativo, se houver
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                
                // Mostra o Banner
                ScaffoldMessenger.of(context).showMaterialBanner(
                  MaterialBanner(
                    content: const Text('Sem conexão com a internet. Verifique sua rede.'),
                    leading: const Icon(Icons.wifi_off, color: Colors.orange),
                    backgroundColor: Colors.orange.shade100,
                    actions: [
                      TextButton(
                        onPressed: () {
                          // Oculta o banner
                          ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                        },
                        child: const Text('DISPENSAR', style: TextStyle(color: Colors.deepOrange)),
                      ),
                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                        },
                        child: const Text('TENTAR NOVAMENTE', style: TextStyle(color: Colors.deepOrange)),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Mostrar Banner'),
            ),
          ],
        ),
      ),
    );
  }
}
