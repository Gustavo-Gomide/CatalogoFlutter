// =============================================================
// NAVIGATOR — Navegação entre telas (Push/Pop)
// =============================================================
import 'package:flutter/material.dart';

class NavigatorExemplo extends StatelessWidget {
  const NavigatorExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navigator (Navegação)')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Navegação Básica:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('O Flutter usa uma "pilha" (stack) de telas.'),
            const SizedBox(height: 16),
            
            // Botão para ir para a próxima tela
            ElevatedButton(
              onPressed: () {
                // Navigator.push adiciona a nova tela no topo da pilha
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SegundaTela(),
                  ),
                );
              },
              child: const Text('Ir para Segunda Tela (Push)'),
            ),

            const SizedBox(height: 24),

            const Text('Passando dados:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TelaComDados(
                      mensagem: 'Olá! Vim da primeira tela.',
                      id: 42,
                    ),
                  ),
                );
              },
              child: const Text('Ir para Tela com Dados'),
            ),

            const SizedBox(height: 24),

            const Text('Esperando um retorno:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                // Aguarda o resultado da tela
                final resultado = await Navigator.push<String>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TelaQueRetornaDado(),
                  ),
                );

                // Mostra o resultado, se houver
                if (resultado != null && context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Retorno: $resultado')),
                  );
                }
              },
              child: const Text('Ir para Tela que Retorna Dado'),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// TELAS SECUNDÁRIAS PARA O EXEMPLO
// ==========================================

class SegundaTela extends StatelessWidget {
  const SegundaTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Segunda Tela')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Esta é a segunda tela.'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Navigator.pop remove a tela atual da pilha, voltando para a anterior
                Navigator.pop(context);
              },
              child: const Text('Voltar (Pop)'),
            ),
          ],
        ),
      ),
    );
  }
}

class TelaComDados extends StatelessWidget {
  final String mensagem;
  final int id;

  const TelaComDados({super.key, required this.mensagem, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tela com Dados')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Mensagem recebida: $mensagem', style: const TextStyle(fontSize: 18)),
            Text('ID recebido: $id', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}

class TelaQueRetornaDado extends StatelessWidget {
  const TelaQueRetornaDado({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Selecione uma opção')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Retorna a string 'Opção A' para a tela anterior
                Navigator.pop(context, 'Opção A');
              },
              child: const Text('Escolher Opção A'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Retorna a string 'Opção B'
                Navigator.pop(context, 'Opção B');
              },
              child: const Text('Escolher Opção B'),
            ),
          ],
        ),
      ),
    );
  }
}
