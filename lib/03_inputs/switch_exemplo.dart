// ignore_for_file: deprecated_member_use
// =============================================================
// SWITCH — Interruptor Liga/Desliga
// =============================================================
import 'package:flutter/material.dart';

class SwitchExemplo extends StatefulWidget {
  const SwitchExemplo({super.key});

  @override
  State<SwitchExemplo> createState() => _SwitchExemploState();
}

class _SwitchExemploState extends State<SwitchExemplo> {
  bool _notificacoes = true;
  bool _modoEscuro = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Switch')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Switch simples:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                Switch(
                  value: _notificacoes,
                  onChanged: (valor) => setState(() => _notificacoes = valor),
                  // Personalização de cores:
                  activeColor: Colors.green, // Cor da "bolinha" quando ligado
                  activeTrackColor: Colors.green.shade200, // Cor da "trilha"
                ),
                const Text('Ativar Notificações'),
              ],
            ),

            const SizedBox(height: 24),

            const Text('SwitchListTile (ideal para configurações):', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('A linha inteira é clicável.'),
            const SizedBox(height: 8),
            SwitchListTile(
              title: const Text('Modo Escuro'),
              subtitle: const Text('Ativa o tema escuro no aplicativo'),
              secondary: const Icon(Icons.dark_mode), // Ícone à esquerda
              value: _modoEscuro,
              onChanged: (valor) => setState(() => _modoEscuro = valor),
            ),
          ],
        ),
      ),
    );
  }
}
