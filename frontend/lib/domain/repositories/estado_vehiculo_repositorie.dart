import '../domain.dart';

abstract class EstadoVehiculoRepositorie {
  Future<List<EstadoVehiculo>> getAllEstadoVehiculo();
}
