import '../domain.dart';

abstract class CondicionVehiculoRepositorie {
  Future<List<CondicionVehiculo>> getAllCondicionVehiculo();
}
