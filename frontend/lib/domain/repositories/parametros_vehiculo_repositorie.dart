import '../domain.dart';

abstract class ParametrosVehiculoRepositorie {
  Future<List<ParametrosVehiculo>> getAllParametrosVehiculo();
}
