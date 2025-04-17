import 'package:ejercicio1/model/factoriaEstadistica.dart';
import 'package:ejercicio1/model/operacion.dart';
import 'package:flutter/material.dart';

class OutputField extends StatelessWidget {
  final List<double> numeros;
  final Operacion operacion;

  const OutputField({Key? key, required this.numeros, required this.operacion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double resultado = 0;

    if (numeros.isNotEmpty) {
      final calculo = FactoriaEstadistica.crearCalculoEstadistico(operacion);
      resultado = calculo.calcular(numeros);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Resultado:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 8.0),
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.blueAccent, width: 1.5),
            ),
            child: Text(
              numeros.isEmpty
                  ? 'No hay datos para calcular'
                  : resultado.toStringAsFixed(2),
              style: const TextStyle(fontSize: 16.0, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
