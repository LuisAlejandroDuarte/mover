import '../domain.dart';

abstract class EstadoVehiculoDatasource {
  Future<List<EstadoVehiculo>> getAllEstadoVehiculo();
}
