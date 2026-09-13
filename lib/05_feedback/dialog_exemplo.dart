// =============================================================
// DIALOG (ALERTDIALOG) — Caixas de diálogo modais
// =============================================================
import 'package:flutter/material.dart';

class DialogExemplo extends StatelessWidget {
  const DialogExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dialog / AlertDialog')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('AlertDialog simples:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Abre o dialog
                showDialog(
                  context: context,
                  // barrierDismissible: false, // Impede de fechar clicando fora
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Atenção'),
                      content: const Text('Deseja realmente apagar este item? Esta ação não pode ser desfeita.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context), // Fecha retornando nada
                          child: const Text('CANCELAR'),
                        ),
                        FilledButton(
                          onPressed: () {
                            Navigator.pop(context); // Fecha
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Item apagado')),
                            );
                          },
                          child: const Text('APAGAR'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Mostrar Alerta'),
            ),

            const SizedBox(height: 48),

            const Text('SimpleDialog:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Usado para escolha de opções simples.'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                final String? conta = await showDialog<String>(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      title: const Text('Selecione uma conta'),
                      children: [
                        SimpleDialogOption(
                          onPressed: () => Navigator.pop(context, 'user1@email.com'),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text('user1@email.com'),
                          ),
                        ),
                        SimpleDialogOption(
                          onPressed: () => Navigator.pop(context, 'user2@email.com'),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text('user2@email.com'),
                          ),
                        ),
                      ],
                    );
                  },
                );

                if (conta != null && context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Selecionou: $conta')),
                  );
                }
              },
              child: const Text('Mostrar SimpleDialog'),
            ),
          ],
        ),
      ),
    );
  }
}
