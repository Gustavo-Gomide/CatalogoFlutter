// =============================================================
// ANIMATEDLIST — Lista rolável com animações em itens
// =============================================================
import 'package:flutter/material.dart';

class AnimatedListExemplo extends StatefulWidget {
  const AnimatedListExemplo({super.key});

  @override
  State<AnimatedListExemplo> createState() => _AnimatedListExemploState();
}

class _AnimatedListExemploState extends State<AnimatedListExemplo> {
  // A chave controla a lista animada
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  
  // A nossa fonte de dados
  final List<String> _itens = ['Item 1', 'Item 2', 'Item 3'];
  int _contador = 4;

  void _adicionarItem() {
    final indice = 0; // Adiciona no topo
    _itens.insert(indice, 'Item $_contador');
    _contador++;
    
    // Avisa a AnimatedList que um item chegou
    _listKey.currentState?.insertItem(
      indice,
      duration: const Duration(milliseconds: 500),
    );
  }

  void _removerItem(int indice) {
    final itemRemovido = _itens.removeAt(indice);
    
    // Avisa a AnimatedList que um item saiu, e fornece a animação de saída
    _listKey.currentState?.removeItem(
      indice,
      (context, animation) {
        // Retorna o widget que será animado ao sair (SizeTransition faz ele encolher)
        return SizeTransition(
          sizeFactor: animation,
          child: Card(
            color: Colors.red.shade100,
            child: ListTile(title: Text(itemRemovido)),
          ),
        );
      },
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedList')),
      floatingActionButton: FloatingActionButton(
        onPressed: _adicionarItem,
        child: const Icon(Icons.add),
      ),
      // AnimatedList em vez de ListView.builder
      body: AnimatedList(
        key: _listKey,
        initialItemCount: _itens.length,
        itemBuilder: (context, indice, animation) {
          // itemBuilder fornece a 'animation' que devemos aplicar ao item
          return SlideTransition(
            position: animation.drive(Tween(
              begin: const Offset(1, 0), // Vem da direita
              end: Offset.zero,
            )),
            child: Card(
              child: ListTile(
                title: Text(_itens[indice]),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _removerItem(indice),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
