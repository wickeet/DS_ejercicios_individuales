import 'package:flutter/material.dart';
import 'package:ejercicio2/model/gestorSuscripciones.dart';
import 'package:ejercicio2/widget/displaySuscripciones.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final gestorSuscripciones = GestorSuscripciones();

    return MaterialApp(
      title: "Gestor de Suscripciones",
      home: DisplaySuscripciones(gestorSuscripciones: gestorSuscripciones),
    );
  }
}
