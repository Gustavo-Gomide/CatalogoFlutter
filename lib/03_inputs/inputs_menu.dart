import 'package:flutter/material.dart';

import 'textfield_exemplo.dart';
import 'checkbox_exemplo.dart';
import 'radio_exemplo.dart';
import 'switch_exemplo.dart';
import 'slider_exemplo.dart';
import 'dropdown_exemplo.dart';
import 'datepicker_exemplo.dart';
import 'form_exemplo.dart';

class InputsMenu extends StatelessWidget {
  const InputsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final exemplos = <_Ex>[
      _Ex('TextField', 'Campo de texto e decoração', const TextFieldExemplo()),
      _Ex('Checkbox', 'Caixa de seleção', const CheckboxExemplo()),
      _Ex('Radio', 'Botão de opção única', const RadioExemplo()),
      _Ex('Switch', 'Interruptor on/off', const SwitchExemplo()),
      _Ex('Slider', 'Controle deslizante', const SliderExemplo()),
      _Ex('Dropdown', 'Menu suspenso', const DropdownExemplo()),
      _Ex('DatePicker / TimePicker', 'Seletor de data e hora', const DatePickerExemplo()),
      _Ex('Form + Validação', 'Formulário com validação', const FormExemplo()),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('03 — Inputs')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: exemplos.length,
        itemBuilder: (context, index) {
          final ex = exemplos[index];
          return Card(
            child: ListTile(
              title: Text(ex.t, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(ex.s),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ex.w)),
            ),
          );
        },
      ),
    );
  }
}

class _Ex {
  final String t, s;
  final Widget w;
  const _Ex(this.t, this.s, this.w);
}
