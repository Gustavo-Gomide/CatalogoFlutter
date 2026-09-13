// =============================================================
// STEPPER — Navegação passo a passo (Wizard)
// =============================================================
import 'package:flutter/material.dart';

class StepperExemplo extends StatefulWidget {
  const StepperExemplo({super.key});

  @override
  State<StepperExemplo> createState() => _StepperExemploState();
}

class _StepperExemploState extends State<StepperExemplo> {
  int _passoAtual = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stepper (Passo a Passo)')),
      body: Stepper(
        // type: StepperType.horizontal, // Descomente para stepper horizontal (em cima)
        currentStep: _passoAtual,
        // Ao clicar em 'Continuar'
        onStepContinue: () {
          if (_passoAtual < 2) {
            setState(() => _passoAtual += 1);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Finalizado!')),
            );
          }
        },
        // Ao clicar em 'Voltar'
        onStepCancel: () {
          if (_passoAtual > 0) {
            setState(() => _passoAtual -= 1);
          }
        },
        // Ao tocar diretamente no número do passo
        onStepTapped: (passo) => setState(() => _passoAtual = passo),
        
        // Definição de cada passo
        steps: [
          Step(
            title: const Text('Dados Pessoais'),
            subtitle: const Text('Informe seu nome'),
            content: const TextField(decoration: InputDecoration(labelText: 'Nome')),
            // Define o estado visual do ícone
            state: _passoAtual > 0 ? StepState.complete : StepState.editing,
            isActive: _passoAtual >= 0,
          ),
          Step(
            title: const Text('Endereço'),
            content: const TextField(decoration: InputDecoration(labelText: 'Rua')),
            state: _passoAtual > 1 ? StepState.complete : 
                   _passoAtual == 1 ? StepState.editing : StepState.indexed,
            isActive: _passoAtual >= 1,
          ),
          Step(
            title: const Text('Confirmação'),
            content: const Text('Revise seus dados e clique em finalizar.'),
            state: _passoAtual == 2 ? StepState.editing : StepState.indexed,
            isActive: _passoAtual >= 2,
          ),
        ],
      ),
    );
  }
}
