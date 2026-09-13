// =============================================================
// CHIP — Tags interativas
// =============================================================
import 'package:flutter/material.dart';

class ChipExemplo extends StatefulWidget {
  const ChipExemplo({super.key});
  @override
  State<ChipExemplo> createState() => _ChipExemploState();
}

class _ChipExemploState extends State<ChipExemplo> {
  final Set<String> _filtros = {'Flutter'};
  int _escolha = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chip')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ----- CHIP BÁSICO -----
            const Text('Chip básico:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(spacing: 8, children: [
              const Chip(label: Text('Simples')),
              Chip(
                avatar: const CircleAvatar(child: Text('F')),
                label: const Text('Com avatar'),
                onDeleted: () {}, // Mostra o X para deletar
                deleteIcon: const Icon(Icons.close, size: 16),
              ),
            ]),

            const SizedBox(height: 24),

            // ----- ACTIONCHIP -----
            const Text('ActionChip:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Chip clicável — dispara uma ação'),
            const SizedBox(height: 8),
            Wrap(spacing: 8, children: [
              ActionChip(
                avatar: const Icon(Icons.alarm, size: 16),
                label: const Text('Lembrete'),
                onPressed: () {},
              ),
              ActionChip(
                label: const Text('Compartilhar'),
                onPressed: () {},
              ),
            ]),

            const SizedBox(height: 24),

            // ----- FILTERCHIP -----
            const Text('FilterChip:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Chip com seleção múltipla — filtros'),
            const SizedBox(height: 8),
            Wrap(spacing: 8, children: [
              for (final tag in ['Flutter', 'Dart', 'Firebase', 'Web'])
                FilterChip(
                  label: Text(tag),
                  selected: _filtros.contains(tag),
                  onSelected: (selecionado) {
                    setState(() {
                      selecionado ? _filtros.add(tag) : _filtros.remove(tag);
                    });
                  },
                ),
            ]),
            Text('Selecionados: ${_filtros.join(", ")}'),

            const SizedBox(height: 24),

            // ----- CHOICECHIP -----
            const Text('ChoiceChip:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Chip com seleção ÚNICA — como radio'),
            const SizedBox(height: 8),
            Wrap(spacing: 8, children: [
              for (int i = 0; i < 3; i++)
                ChoiceChip(
                  label: Text(['Pequeno', 'Médio', 'Grande'][i]),
                  selected: _escolha == i,
                  onSelected: (_) => setState(() => _escolha = i),
                ),
            ]),
            Text('Escolha: ${['Pequeno', 'Médio', 'Grande'][_escolha]}'),
          ],
        ),
      ),
    );
  }
}
