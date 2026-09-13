// =============================================================
// BOTÕES — Todos os tipos de botão do Flutter
// =============================================================
import 'package:flutter/material.dart';

class BotoesExemplo extends StatelessWidget {
  const BotoesExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Botões')),
      // FAB fora do body
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'FloatingActionButton',
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ----- ELEVATEDBUTTON -----
            const Text('ElevatedButton:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Botão com sombra/elevação — ação principal'),
            const SizedBox(height: 8),
            ElevatedButton(
              // onPressed — ação ao clicar (null = desabilitado)
              onPressed: () {},
              // style — personalização visual
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,           // cor de fundo
                foregroundColor: Colors.white,             // cor do texto/ícone
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),  // arredondamento
                ),
                elevation: 4,                              // sombra
              ),
              child: const Text('Elevated'),
            ),
            const SizedBox(height: 8),
            // Com ícone
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.send),
              label: const Text('Com ícone'),
            ),

            const SizedBox(height: 24),

            // ----- FILLEDBUTTON -----
            const Text('FilledButton:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Botão preenchido — Material 3'),
            const SizedBox(height: 8),
            FilledButton(onPressed: () {}, child: const Text('Filled')),
            const SizedBox(height: 8),
            FilledButton.tonal(onPressed: () {}, child: const Text('Filled Tonal')),

            const SizedBox(height: 24),

            // ----- TEXTBUTTON -----
            const Text('TextButton:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Botão sem fundo — ação secundária'),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {},
              child: const Text('Text Button'),
            ),

            const SizedBox(height: 24),

            // ----- OUTLINEDBUTTON -----
            const Text('OutlinedButton:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Botão com borda — ação alternativa'),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.indigo, width: 2),
              ),
              child: const Text('Outlined'),
            ),

            const SizedBox(height: 24),

            // ----- ICONBUTTON -----
            const Text('IconButton:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Botão só com ícone'),
            const SizedBox(height: 8),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                  color: Colors.red,
                  iconSize: 32,
                  tooltip: 'Favorito', // Dica ao segurar
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                ),
                // IconButton com estilo filled
                IconButton.filled(
                  onPressed: () {},
                  icon: const Icon(Icons.play_arrow),
                ),
                IconButton.filledTonal(
                  onPressed: () {},
                  icon: const Icon(Icons.pause),
                ),
                IconButton.outlined(
                  onPressed: () {},
                  icon: const Icon(Icons.stop),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // ----- BOTÃO DESABILITADO -----
            const Text('Botão desabilitado:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Passe null para onPressed'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: null, // null = desabilitado!
              child: const Text('Desabilitado'),
            ),

            const SizedBox(height: 24),

            // ----- BOTÃO CUSTOMIZADO (dimensões) -----
            const Text('Botão com tamanho customizado:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity, // Largura total
              height: 56,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('BOTÃO LARGURA TOTAL', style: TextStyle(fontSize: 16)),
              ),
            ),

            const SizedBox(height: 24),

            // ----- SEGMENTEDBUTTON -----
            const Text('SegmentedButton:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Grupo de botões com seleção'),
            const SizedBox(height: 8),
            _SegmentedDemo(),

            const SizedBox(height: 80), // Espaço para o FAB
          ],
        ),
      ),
    );
  }
}

class _SegmentedDemo extends StatefulWidget {
  @override
  State<_SegmentedDemo> createState() => _SegmentedDemoState();
}

class _SegmentedDemoState extends State<_SegmentedDemo> {
  String _selecionado = 'dia';

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<String>(
      segments: const [
        ButtonSegment(value: 'dia', label: Text('Dia'), icon: Icon(Icons.wb_sunny)),
        ButtonSegment(value: 'semana', label: Text('Semana'), icon: Icon(Icons.date_range)),
        ButtonSegment(value: 'mes', label: Text('Mês'), icon: Icon(Icons.calendar_month)),
      ],
      selected: {_selecionado},
      onSelectionChanged: (novo) => setState(() => _selecionado = novo.first),
    );
  }
}
