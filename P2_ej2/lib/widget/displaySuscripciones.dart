import 'package:flutter/material.dart';
import 'package:ejercicio2/model/suscripcion.dart';
import 'package:ejercicio2/model/gestorSuscripciones.dart';
import 'package:ejercicio2/widget/showSuscripcion.dart';
import 'package:ejercicio2/widget/addSuscripcion.dart';

class DisplaySuscripciones extends StatefulWidget {
  final GestorSuscripciones gestorSuscripciones;

  const DisplaySuscripciones({Key? key, required this.gestorSuscripciones})
    : super(key: key);

  @override
  _DisplaySuscripcionesState createState() => _DisplaySuscripcionesState();
}

class _DisplaySuscripcionesState extends State<DisplaySuscripciones> {
  late List<Suscripcion> suscripciones;

  @override
  void initState() {
    super.initState();
    suscripciones = widget.gestorSuscripciones.suscripciones.toList();
  }

  void _addSuscripcion(Suscripcion suscripcion) {
    setState(() {
      widget.gestorSuscripciones.addSuscripcion(suscripcion);
      suscripciones = widget.gestorSuscripciones.suscripciones.toList();
    });
  }

  void _removeSuscripcion(int index) {
    setState(() {
      widget.gestorSuscripciones.deleteSuscripcion(suscripciones[index]);
      suscripciones = widget.gestorSuscripciones.suscripciones.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    double totalCost = suscripciones.fold(
      0,
      (sum, suscripcion) => sum + suscripcion.precioMensual,
    );

    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Suscripciones',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                AddSuscripcion(
                  onAdd: (nombre, precio) {
                    _addSuscripcion(
                      Suscripcion(descripcion: nombre, precioMensual: precio),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: suscripciones.length,
              itemBuilder: (context, index) {
                return ShowSuscripcion(
                  suscripcion: suscripciones[index],
                  onDelete: () => _removeSuscripcion(index),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Costo Total: ${totalCost.toStringAsFixed(2)}€',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
