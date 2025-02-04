import '../domain.dart';

abstract class UbicacionRepositorie {
  Future<int> createUbicacion(Ubicacion ubicacion);
}
