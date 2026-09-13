// ignore_for_file: deprecated_member_use
// =============================================================
// REORDERABLELISTVIEW — Lista rolável onde o usuário reorganiza
// =============================================================
import 'package:flutter/material.dart';

class ReorderableListExemplo extends StatefulWidget {
  const ReorderableListExemplo({super.key});

  @override
  State<ReorderableListExemplo> createState() => _ReorderableListExemploState();
}

class _ReorderableListExemploState extends State<ReorderableListExemplo> {
  // A lista de dados que será reorganizada
  final List<String> _itens = [
    'Estudar Flutter',
    'Fazer compras',
    'Limpar a casa',
    'Ler um livro',
    'Ir à academia'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ReorderableListView')),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Segure no ícone à direita e arraste para reorganizar.'),
          ),
          Expanded(
            child: ReorderableListView(
              // Função chamada quando um item é solto na nova posição
              onReorder: (int velhoIndice, int novoIndice) {
                setState(() {
                  // Ajuste necessário porque ao mover para baixo, 
                  // o novo índice conta com o item que será removido
                  if (velhoIndice < novoIndice) {
                    novoIndice -= 1;
                  }
                  // Remove da posição velha e insere na nova
                  final item = _itens.removeAt(velhoIndice);
                  _itens.insert(novoIndice, item);
                });
              },
              // Constrói os filhos iterando sobre a lista
              children: [
                for (int i = 0; i < _itens.length; i++)
                  ListTile(
                    // A key é OBRIGATÓRIA para o ReorderableListView não se perder
                    key: ValueKey(_itens[i]),
                    title: Text(_itens[i]),
                    leading: CircleAvatar(child: Text('${i + 1}')),
                    trailing: const Icon(Icons.drag_handle), // Ícone visual indicando que pode arrastar
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
