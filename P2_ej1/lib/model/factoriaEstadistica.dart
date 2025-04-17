import 'package:ejercicio1/model/operacionEstadistica.dart';
import 'package:ejercicio1/model/operacion.dart';

class FactoriaEstadistica {

  static OperacionEstadistica crearCalculoEstadistico(Operacion op){
    switch (op){
      case Operacion.MEDIA:
        return Media();
      case Operacion.MODA:
        return Moda();
      case Operacion.MEDIANA:
        return Mediana();
      case Operacion.VARIANZA:
        return Varianza();
      case Operacion.DESVIACION:
        return Desviacion();
    }
  }
}