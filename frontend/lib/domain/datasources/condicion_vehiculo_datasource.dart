import '../domain.dart';

abstract class CondicionVehiculoDatasource {
  Future<List<CondicionVehiculo>> getAllCondicionVehiculo();
}
