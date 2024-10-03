import '../domain.dart';

abstract class ParametrosVehiculoDatasource {
  Future<List<ParametrosVehiculo>> getAllParametrosVehiculo();
}
