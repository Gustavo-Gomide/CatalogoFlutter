// =============================================================
// LISTVIEW — Lista rolável de itens
// =============================================================
// ListView é o widget de scroll mais usado no Flutter.
// Construtores:
//   ListView()          → lista simples com children fixos
//   ListView.builder()  → lazy loading (melhor para listas grandes)
//   ListView.separated()→ com separador entre itens
//   ListView.custom()   → controle total

import 'package:flutter/material.dart';

class ListExemplo extends StatelessWidget {
  const ListExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ListView'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'builder'),
              Tab(text: 'separated'),
              Tab(text: 'simples'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // ----- LISTVIEW.BUILDER -----
            // Constrói itens sob demanda (lazy) — melhor performance
            ListView.builder(
              padding: const EdgeInsets.all(8),
              // itemCount — total de itens na lista
              itemCount: 50,
              // itemBuilder — função que constrói cada item
              // Recebe o context e o index (posição do item)
              itemBuilder: (context, index) {
                return ListTile(
                  // leading — widget no início (esquerda)
                  leading: CircleAvatar(child: Text('${index + 1}')),
                  // title — texto principal
                  title: Text('Item $index'),
                  // subtitle — texto secundário abaixo do título
                  subtitle: Text('Descrição do item $index'),
                  // trailing — widget no final (direita)
                  trailing: const Icon(Icons.chevron_right),
                  // onTap — ação ao tocar no item
                  onTap: () {},
                );
              },
            ),

            // ----- LISTVIEW.SEPARATED -----
            // Igual ao builder, mas com separador entre os itens
            ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: 30,
              // separatorBuilder — constrói o widget separador
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.star, color: Colors.amber.shade700),
                  title: Text('Elemento $index'),
                );
              },
            ),

            // ----- LISTVIEW SIMPLES (com children fixos) -----
            ListView(
              padding: const EdgeInsets.all(16),
              // scrollDirection — direção do scroll
              //   Axis.vertical (padrão) — scroll para cima/baixo
              //   Axis.horizontal — scroll para esquerda/direita
              // physics — comportamento do scroll
              //   BouncingScrollPhysics() — efeito "quique" do iOS
              //   ClampingScrollPhysics() — efeito do Android (para no limite)
              //   NeverScrollableScrollPhysics() — desativa o scroll
              physics: const BouncingScrollPhysics(),
              children: [
                // Você pode colocar QUALQUER widget como filho
                Container(height: 80, color: Colors.red.shade200, margin: const EdgeInsets.only(bottom: 8)),
                Container(height: 80, color: Colors.green.shade200, margin: const EdgeInsets.only(bottom: 8)),
                Container(height: 80, color: Colors.blue.shade200, margin: const EdgeInsets.only(bottom: 8)),
                const Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('ListView simples aceita qualquer widget como filho'),
                  ),
                ),
                // ListTile — item padrão de lista
                const ListTile(
                  leading: Icon(Icons.info),
                  title: Text('ListTile dentro do ListView'),
                  subtitle: Text('Misturando widgets diferentes'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
