// =============================================================
// TABLE — Tabela com linhas e colunas
// =============================================================
// Table organiza widgets em linhas e colunas com controle preciso.
// Diferente de GridView, Table NÃO rola — use dentro de um scroll se precisar.

import 'package:flutter/material.dart';

class TableExemplo extends StatelessWidget {
  const TableExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Table')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Table básica:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Table(
              // border — borda da tabela
              border: TableBorder.all(
                color: Colors.grey.shade400,
                width: 1,
                borderRadius: BorderRadius.circular(8),
              ),

              // columnWidths — controla a largura de cada coluna
              // Tipos de largura:
              //   FlexColumnWidth(1) → proporcional (padrão)
              //   FixedColumnWidth(100) → largura fixa em pixels
              //   FractionColumnWidth(0.3) → 30% da largura da tabela
              //   IntrinsicColumnWidth() → largura do maior conteúdo
              //   MinColumnWidth(a, b) → menor entre a e b
              //   MaxColumnWidth(a, b) → maior entre a e b
              columnWidths: const {
                0: FixedColumnWidth(50),         // Coluna 0: 50px fixo
                1: FlexColumnWidth(2),           // Coluna 1: flex peso 2
                2: FlexColumnWidth(1),           // Coluna 2: flex peso 1
              },

              // defaultVerticalAlignment — alinhamento vertical padrão das células
              //   TableCellVerticalAlignment.top
              //   TableCellVerticalAlignment.middle (padrão)
              //   TableCellVerticalAlignment.bottom
              //   TableCellVerticalAlignment.fill — estica
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,

              children: [
                // TableRow — cada linha da tabela
                TableRow(
                  // decoration — decoração de fundo da linha
                  decoration: BoxDecoration(color: Colors.indigo.shade100),
                  children: const [
                    Padding(padding: EdgeInsets.all(8), child: Text('#', style: TextStyle(fontWeight: FontWeight.bold))),
                    Padding(padding: EdgeInsets.all(8), child: Text('Nome', style: TextStyle(fontWeight: FontWeight.bold))),
                    Padding(padding: EdgeInsets.all(8), child: Text('Nota', style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                ),
                _linha('1', 'Ana', '9.5'),
                _linha('2', 'Bruno', '8.2'),
                _linha('3', 'Carla', '10.0'),
                _linha('4', 'Diego', '7.8'),
              ],
            ),

            const SizedBox(height: 24),

            // ----- DataTable (alternativa mais rica) -----
            const Text('DataTable (alternativa mais rica):', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Já vem com cabeçalho, ordenação e seleção'),
            const SizedBox(height: 8),
            DataTable(
              // columns — cabeçalhos das colunas
              columns: const [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Produto')),
                DataColumn(label: Text('Preço'), numeric: true), // numeric alinha à direita
              ],
              // rows — linhas de dados
              rows: const [
                DataRow(cells: [
                  DataCell(Text('001')),
                  DataCell(Text('Teclado')),
                  DataCell(Text('R\$ 150')),
                ]),
                DataRow(cells: [
                  DataCell(Text('002')),
                  DataCell(Text('Mouse')),
                  DataCell(Text('R\$ 80')),
                ]),
                DataRow(
                  // selected — destaca a linha
                  selected: true,
                  cells: [
                    DataCell(Text('003')),
                    DataCell(Text('Monitor')),
                    DataCell(Text('R\$ 1200')),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static TableRow _linha(String id, String nome, String nota) {
    return TableRow(
      children: [
        Padding(padding: const EdgeInsets.all(8), child: Text(id)),
        Padding(padding: const EdgeInsets.all(8), child: Text(nome)),
        Padding(padding: const EdgeInsets.all(8), child: Text(nota)),
      ],
    );
  }
}
