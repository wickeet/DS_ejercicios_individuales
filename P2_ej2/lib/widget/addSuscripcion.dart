import 'package:flutter/material.dart';

class AddSuscripcion extends StatefulWidget {
  final void Function(String nombre, double precio) onAdd;

  const AddSuscripcion({Key? key, required this.onAdd}) : super(key: key);

  @override
  _AddSuscripcionState createState() => _AddSuscripcionState();
}

class _AddSuscripcionState extends State<AddSuscripcion> {
  final _formKey = GlobalKey<FormState>();
  String _nombre = '';
  double _precio = 0.0;

  void _showForm() {
    showDialog(
      context: context, // Usa el contexto local del widget
      builder: (BuildContext dialogContext) {
        // Cambia el nombre del contexto aquí
        return AlertDialog(
          title: const Text('Añadir Suscripción'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Nombre'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa un nombre';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _nombre = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Precio'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa un precio';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Por favor ingresa un número válido';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _precio = double.parse(value!);
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(
                  dialogContext,
                ).pop(); // Usa el contexto local del diálogo
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  widget.onAdd(_nombre, _precio);
                  Navigator.of(
                    dialogContext,
                  ).pop();
                }
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shadowColor: Colors.black,
        elevation: 2,
        side: const BorderSide(color: Colors.white, width: 2),
      ),
      onPressed: _showForm,
      child: const Text(
        'Añadir Suscripción',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
