import 'dart:math';

abstract class OperacionEstadistica {
  double calcular(List<double> datos);
}

class Media extends OperacionEstadistica {

  @override
  double calcular(List<double> datos) {
    double suma = 0;
    for (var dato in datos){
      suma += dato;
    }

    return suma / datos.length;
  }

}

class Moda extends OperacionEstadistica {

  @override
  double calcular(List<double> datos) {
    Map<double, int> freq = {};
    for (var dato in datos){
      freq[dato] = (freq[dato] ?? 0) + 1;
    }
    return freq.entries.reduce((a, b) => a.value > b.value ? a : b).key;
  }

}

class Mediana extends OperacionEstadistica {

  @override
  double calcular(List<double> datos) {
    datos.sort();
    int mitad = datos.length ~/2;

    return datos[mitad];
  }

}

class Varianza extends OperacionEstadistica {

  @override
  double calcular(List<double> datos) {
    double media = Media().calcular(datos);
    double varianza = 0;

    for (var dato in datos) {
      varianza += pow(dato - media, 2);
    }

    return varianza/datos.length;
  }

}

class Desviacion extends OperacionEstadistica {

  @override
  double calcular(List<double> datos) {
    return sqrt(Varianza().calcular(datos));
  }

}