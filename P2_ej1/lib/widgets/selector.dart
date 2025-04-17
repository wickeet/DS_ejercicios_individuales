import 'package:ejercicio1/model/operacion.dart';
import 'package:flutter/material.dart';

class Selector extends StatefulWidget {
  final Function(Operacion) onOperacionSeleccionada;

  Selector({required this.onOperacionSeleccionada});

  @override
  State<StatefulWidget> createState() => _SelectorState();
}

class _SelectorState extends State<Selector> {
  Operacion _operacion = Operacion.MEDIA;

  void _setOperacion(Operacion op){
    setState(() {
      _operacion = op;
    });
    widget.onOperacionSeleccionada(_operacion);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Seleccione una operación:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blueAccent, width: 1),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<Operacion>(
                value: _operacion,
                onChanged: (Operacion? op) {
                  if (op != null) {
                    _setOperacion(op);
                  }
                },
                items: Operacion.values.map((Operacion op) {
                  return DropdownMenuItem<Operacion>(
                    value: op,
                    child: Text(
                      op.toString().split('.').last,
                      style: TextStyle(fontSize: 14),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

}