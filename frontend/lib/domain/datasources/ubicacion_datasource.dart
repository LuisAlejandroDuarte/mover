import '../domain.dart';

abstract class UbicacionDatasource {
  Future<int> createUbicacion(Ubicacion ubicacion);
}
