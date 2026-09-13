// =============================================================
// SLIDER — Controle deslizante de valores numéricos
// =============================================================
import 'package:flutter/material.dart';

class SliderExemplo extends StatefulWidget {
  const SliderExemplo({super.key});

  @override
  State<SliderExemplo> createState() => _SliderExemploState();
}

class _SliderExemploState extends State<SliderExemplo> {
  double _volume = 50;
  RangeValues _faixaPreco = const RangeValues(100, 500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slider')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Slider básico:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Slider(
              value: _volume,
              min: 0,
              max: 100,
              // divisions: 10, // Se quiser "pulos" fixos (0, 10, 20...)
              label: '${_volume.round()}%', // Mostra ao arrastar (se tiver divisions)
              onChanged: (valor) => setState(() => _volume = valor),
            ),
            Text('Volume atual: ${_volume.round()}%'),

            const SizedBox(height: 48),

            const Text('RangeSlider:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Seleciona um intervalo (mínimo e máximo).'),
            const SizedBox(height: 8),
            RangeSlider(
              values: _faixaPreco,
              min: 0,
              max: 1000,
              divisions: 20, // Pulos de 50 em 50
              labels: RangeLabels(
                'R\$ ${_faixaPreco.start.round()}',
                'R\$ ${_faixaPreco.end.round()}',
              ),
              onChanged: (valores) => setState(() => _faixaPreco = valores),
            ),
            Text('Preço: de R\$ ${_faixaPreco.start.round()} até R\$ ${_faixaPreco.end.round()}'),
          ],
        ),
      ),
    );
  }
}
