// =============================================================
// TEXTFIELD — Campo de entrada de texto
// =============================================================
import 'package:flutter/material.dart';

class TextFieldExemplo extends StatefulWidget {
  const TextFieldExemplo({super.key});

  @override
  State<TextFieldExemplo> createState() => _TextFieldExemploState();
}

class _TextFieldExemploState extends State<TextFieldExemplo> {
  // TextEditingController gerencia o texto digitado
  final TextEditingController _controller = TextEditingController();
  String _textoDigitado = '';

  @override
  void dispose() {
    _controller.dispose(); // Sempre libere o controller!
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TextField')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('TextField básico:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const TextField(), // O mais simples possível

            const SizedBox(height: 24),

            const Text('TextField com InputDecoration:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Nome completo',        // Rótulo que flutua
                hintText: 'Digite seu nome aqui',  // Placeholder
                prefixIcon: Icon(Icons.person),    // Ícone à esquerda
                border: OutlineInputBorder(),      // Borda contornada
              ),
              onChanged: (texto) {
                // onChanged é chamado a cada letra digitada
                setState(() => _textoDigitado = texto);
              },
            ),
            const SizedBox(height: 8),
            Text('Você digitou: $_textoDigitado'),

            const SizedBox(height: 24),

            const Text('Tipos de teclado (keyboardType):', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const TextField(
              keyboardType: TextInputType.number, // Teclado numérico
              decoration: InputDecoration(
                labelText: 'Idade',
                icon: Icon(Icons.cake), // Ícone fora do campo
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              keyboardType: TextInputType.emailAddress, // Teclado com @
              decoration: InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 24),

            const Text('Senha (obscureText):', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const TextField(
              obscureText: true, // Esconde os caracteres (***)
              decoration: InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.visibility), // Ícone à direita
              ),
            ),

            const SizedBox(height: 24),

            const Text('TextField com Controller:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Use o controller para ler, definir ou limpar o texto programaticamente.'),
            const SizedBox(height: 8),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Mensagem',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Lê o texto do controller
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Valor lido: ${_controller.text}')),
                    );
                  },
                  child: const Text('Ler'),
                ),
                const SizedBox(width: 8),
                OutlinedButton(
                  onPressed: () {
                    // Define o texto programaticamente
                    _controller.text = 'Olá pelo código!';
                  },
                  child: const Text('Definir'),
                ),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: () {
                    // Limpa o texto
                    _controller.clear();
                  },
                  child: const Text('Limpar'),
                ),
              ],
            ),

            const SizedBox(height: 24),

            const Text('TextField Multilinha:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const TextField(
              maxLines: 4, // Permite 4 linhas de altura
              decoration: InputDecoration(
                labelText: 'Comentários',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
