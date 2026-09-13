// =============================================================
// DROPDOWNBUTTON — Menu suspenso (Select)
// =============================================================
import 'package:flutter/material.dart';

class DropdownExemplo extends StatefulWidget {
  const DropdownExemplo({super.key});

  @override
  State<DropdownExemplo> createState() => _DropdownExemploState();
}

class _DropdownExemploState extends State<DropdownExemplo> {
  // O valor selecionado
  String _cidadeSelecionada = 'São Paulo';
  
  // A lista de opções
  final List<String> _cidades = ['São Paulo', 'Rio de Janeiro', 'Belo Horizonte', 'Curitiba'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DropdownButton')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('DropdownButton simples:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            DropdownButton<String>(
              value: _cidadeSelecionada,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.indigo, fontSize: 16),
              underline: Container(
                height: 2,
                color: Colors.indigoAccent,
              ),
              onChanged: (String? novoValor) {
                if (novoValor != null) {
                  setState(() => _cidadeSelecionada = novoValor);
                }
              },
              // Constrói os itens do menu
              items: _cidades.map<DropdownMenuItem<String>>((String valor) {
                return DropdownMenuItem<String>(
                  value: valor,
                  child: Text(valor),
                );
              }).toList(),
            ),

            const SizedBox(height: 32),

            const Text('DropdownButtonFormField:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Melhor para formulários (suporta InputDecoration e validação).'),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Selecione o estado',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.map),
              ),
              // value: null, // Pode iniciar vazio
              items: const [
                DropdownMenuItem(value: 'SP', child: Text('São Paulo')),
                DropdownMenuItem(value: 'RJ', child: Text('Rio de Janeiro')),
                DropdownMenuItem(value: 'MG', child: Text('Minas Gerais')),
              ],
              onChanged: (valor) {
                // Ação ao selecionar
              },
            ),
          ],
        ),
      ),
    );
  }
}
