// =============================================================
// CHECKBOX — Caixa de seleção
// =============================================================
import 'package:flutter/material.dart';

class CheckboxExemplo extends StatefulWidget {
  const CheckboxExemplo({super.key});

  @override
  State<CheckboxExemplo> createState() => _CheckboxExemploState();
}

class _CheckboxExemploState extends State<CheckboxExemplo> {
  bool _aceitaTermos = false;
  bool _receberEmail = true;
  bool? _tristateValor = true; // Pode ser true, false ou null

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkbox')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Checkbox simples:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                Checkbox(
                  value: _aceitaTermos,
                  onChanged: (valor) {
                    // Checkbox não gerencia seu próprio estado, você precisa atualizar
                    setState(() => _aceitaTermos = valor ?? false);
                  },
                ),
                const Text('Aceito os termos e condições'),
              ],
            ),

            const SizedBox(height: 24),

            const Text('CheckboxListTile (melhor para formulários):', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('A linha inteira é clicável.'),
            const SizedBox(height: 8),
            CheckboxListTile(
              title: const Text('Receber e-mails promocionais'),
              subtitle: const Text('Prometemos não enviar spam'),
              secondary: const Icon(Icons.email), // Ícone à esquerda
              controlAffinity: ListTileControlAffinity.trailing, // Checkbox à direita
              value: _receberEmail,
              onChanged: (valor) => setState(() => _receberEmail = valor ?? false),
            ),

            const SizedBox(height: 24),

            const Text('Checkbox Tristate:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Permite o valor "null" (estado indeterminado).'),
            const SizedBox(height: 8),
            Row(
              children: [
                Checkbox(
                  tristate: true, // Habilita o 3º estado
                  value: _tristateValor,
                  onChanged: (valor) => setState(() => _tristateValor = valor),
                ),
                Text('Valor: $_tristateValor'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
