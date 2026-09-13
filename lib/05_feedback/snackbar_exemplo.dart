// =============================================================
// SNACKBAR — Notificação rápida na parte inferior
// =============================================================
import 'package:flutter/material.dart';

class SnackBarExemplo extends StatelessWidget {
  const SnackBarExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SnackBar')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('SnackBar Simples:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // 1. Opcional: remove qualquer SnackBar atual antes de mostrar o novo
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                
                // 2. Cria e mostra o SnackBar
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Mensagem enviada com sucesso!'),
                    duration: Duration(seconds: 2), // Tempo na tela
                  ),
                );
              },
              child: const Text('Mostrar SnackBar'),
            ),

            const SizedBox(height: 32),

            const Text('SnackBar com Ação:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Email deletado.'),
                    // action adiciona um botão no canto direito
                    action: SnackBarAction(
                      label: 'DESFAZER',
                      textColor: Colors.amber,
                      onPressed: () {
                        // Ação ao clicar em DESFAZER
                        debugPrint('Desfez a exclusão');
                      },
                    ),
                    behavior: SnackBarBehavior.floating, // Flutua acima da borda
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Arredondado
                    ),
                  ),
                );
              },
              child: const Text('Mostrar SnackBar com Ação'),
            ),
          ],
        ),
      ),
    );
  }
}
