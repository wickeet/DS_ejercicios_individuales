import 'package:ejercicio1/model/operacion.dart';
import 'package:ejercicio1/widgets/selector.dart';
import 'package:ejercicio1/widgets/inputField.dart';
import 'package:ejercicio1/widgets/outputField.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculo de Operaciones Estadisticas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Operacion _operacion = Operacion.MEDIA;
  late TextEditingController _controller;
  List<double> _numeros = [];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _setOperacion(Operacion op) {
    setState(() {
      _operacion = op;
    });
  }

  void _onParseNumber(List<double> numeros) {
    setState(() {
      _numeros = numeros;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text(
        "Calculadora Estadística",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: [
            Shadow(
              offset: Offset(2, 2),
              blurRadius: 4,
              color: Colors.black45,
            ),
          ],
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.blueAccent,
    ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: InputField(
                controller: _controller,
                onParseNumber: _onParseNumber,
              ),
            ),
            SizedBox(width: 16),
            Expanded(child: Selector(onOperacionSeleccionada: _setOperacion)),
            SizedBox(width: 16),
            Expanded(
              child: OutputField(numeros: _numeros, operacion: _operacion),
            ),
          ],
        ),
      ),
    );
  }
}
