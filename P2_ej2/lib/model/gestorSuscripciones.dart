import 'dart:collection';
import 'package:ejercicio2/model/suscripcion.dart';

class GestorSuscripciones {
  final List<Suscripcion> _suscripciones = [];

  UnmodifiableListView<Suscripcion> get suscripciones =>
      UnmodifiableListView(_suscripciones);

  void addSuscripcion(Suscripcion suscripcion) {
    _suscripciones.add(suscripcion);
  }

  void deleteSuscripcion(Suscripcion suscripcion) {
    _suscripciones.remove(suscripcion);
  }

  double calcularTotalMensual() {
    return _suscripciones.fold(
      0,
      (total, suscripcion) => total + suscripcion.precioMensual,
    );
  }
}
