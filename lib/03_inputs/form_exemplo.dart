// =============================================================
// FORM & TEXTFORMFIELD — Validação de formulários
// =============================================================
import 'package:flutter/material.dart';

class FormExemplo extends StatefulWidget {
  const FormExemplo({super.key});

  @override
  State<FormExemplo> createState() => _FormExemploState();
}

class _FormExemploState extends State<FormExemplo> {
  // A chave global identifica o Form e permite validar os campos dele
  final _formKey = GlobalKey<FormState>();
  
  String _nome = '';
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form e Validação')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        // O widget Form agrupa vários campos (TextFormField)
        child: Form(
          key: _formKey, // Atribui a chave!
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'O TextFormField é um TextField com suporte a validação embutida.',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),

              // CAMPO NOME
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nome completo',
                  border: OutlineInputBorder(),
                ),
                // validator: retorna null se for válido, ou uma string com o erro
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite seu nome';
                  }
                  if (value.length < 3) {
                    return 'O nome deve ter no mínimo 3 letras';
                  }
                  return null; // Válido!
                },
                // onSaved: chamado quando o formulário é salvo (formKey.currentState!.save())
                onSaved: (value) => _nome = value ?? '',
              ),

              const SizedBox(height: 16),

              // CAMPO EMAIL
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite seu e-mail';
                  }
                  if (!value.contains('@')) {
                    return 'Digite um e-mail válido';
                  }
                  return null;
                },
                onSaved: (value) => _email = value ?? '',
              ),

              const SizedBox(height: 32),

              // BOTÃO DE SUBMIT
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // _formKey.currentState!.validate() executa as funções "validator" de todos os campos
                    if (_formKey.currentState!.validate()) {
                      // Se tudo estiver válido, salva os dados
                      _formKey.currentState!.save(); // Chama o onSaved de todos os campos

                      // Simula envio
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Processando dados: $_nome | $_email')),
                      );
                    }
                  },
                  child: const Text('ENVIAR FORMULÁRIO', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
