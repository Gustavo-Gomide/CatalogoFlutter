// ignore_for_file: deprecated_member_use
// =============================================================
// RADIO — Botão de opção única (grupo)
// =============================================================
import 'package:flutter/material.dart';

class RadioExemplo extends StatefulWidget {
  const RadioExemplo({super.key});

  @override
  State<RadioExemplo> createState() => _RadioExemploState();
}

class _RadioExemploState extends State<RadioExemplo> {
  // A variável de estado que guarda a opção selecionada
  String _opcaoSelecionada = 'A';
  int _metodoPagamento = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Radio')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Radio simples (Row):', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                Radio<String>(
                  value: 'A', // O valor deste botão
                  groupValue: _opcaoSelecionada, // O valor selecionado no grupo
                  onChanged: (valor) => setState(() => _opcaoSelecionada = valor!),
                ),
                const Text('Opção A'),
                const SizedBox(width: 16),
                Radio<String>(
                  value: 'B',
                  groupValue: _opcaoSelecionada,
                  onChanged: (valor) => setState(() => _opcaoSelecionada = valor!),
                ),
                const Text('Opção B'),
              ],
            ),
            const SizedBox(height: 8),
            Text('Selecionado: $_opcaoSelecionada'),

            const SizedBox(height: 32),

            const Text('RadioListTile (melhor para formulários):', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('A linha inteira é clicável.'),
            const SizedBox(height: 8),
            
            // Opção 1
            RadioListTile<int>(
              title: const Text('Cartão de Crédito'),
              subtitle: const Text('Visa, Mastercard, etc.'),
              secondary: const Icon(Icons.credit_card),
              value: 1, // O valor deste item
              groupValue: _metodoPagamento, // O valor global do grupo
              onChanged: (valor) => setState(() => _metodoPagamento = valor!),
            ),
            // Opção 2
            RadioListTile<int>(
              title: const Text('Boleto Bancário'),
              secondary: const Icon(Icons.request_page),
              value: 2,
              groupValue: _metodoPagamento,
              onChanged: (valor) => setState(() => _metodoPagamento = valor!),
            ),
            // Opção 3
            RadioListTile<int>(
              title: const Text('Pix'),
              secondary: const Icon(Icons.qr_code),
              value: 3,
              groupValue: _metodoPagamento,
              onChanged: (valor) => setState(() => _metodoPagamento = valor!),
            ),
          ],
        ),
      ),
    );
  }
}
