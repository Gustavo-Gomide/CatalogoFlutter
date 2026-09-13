// =============================================================
// DATEPICKER & TIMEPICKER — Selecionadores de data e hora
// =============================================================
import 'package:flutter/material.dart';

class DatePickerExemplo extends StatefulWidget {
  const DatePickerExemplo({super.key});

  @override
  State<DatePickerExemplo> createState() => _DatePickerExemploState();
}

class _DatePickerExemploState extends State<DatePickerExemplo> {
  DateTime? _dataSelecionada;
  TimeOfDay? _horaSelecionada;

  // Função para abrir o calendário
  Future<void> _selecionarData(BuildContext context) async {
    final DateTime? escolhida = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),           // Data que abre selecionada
      firstDate: DateTime(2000),             // Data mínima permitida
      lastDate: DateTime(2050),              // Data máxima permitida
      helpText: 'Selecione a data de nascimento',
    );
    if (escolhida != null && escolhida != _dataSelecionada) {
      setState(() => _dataSelecionada = escolhida);
    }
  }

  // Função para abrir o relógio
  Future<void> _selecionarHora(BuildContext context) async {
    final TimeOfDay? escolhida = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (escolhida != null && escolhida != _horaSelecionada) {
      setState(() => _horaSelecionada = escolhida);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DatePicker e TimePicker')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('showDatePicker:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Abre o calendário modal do sistema.'),
            const SizedBox(height: 8),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () => _selecionarData(context),
                  icon: const Icon(Icons.calendar_month),
                  label: const Text('Escolher Data'),
                ),
                const SizedBox(width: 16),
                Text(
                  _dataSelecionada == null 
                    ? 'Nenhuma data' 
                    // Formatando a data manualmente para dd/mm/aaaa
                    : '${_dataSelecionada!.day}/${_dataSelecionada!.month}/${_dataSelecionada!.year}'
                ),
              ],
            ),

            const SizedBox(height: 32),

            const Text('showTimePicker:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Abre o seletor de horas modal.'),
            const SizedBox(height: 8),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () => _selecionarHora(context),
                  icon: const Icon(Icons.access_time),
                  label: const Text('Escolher Hora'),
                ),
                const SizedBox(width: 16),
                Text(
                  _horaSelecionada == null
                    ? 'Nenhuma hora'
                    : _horaSelecionada!.format(context) // Formata baseado no local do aparelho
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
