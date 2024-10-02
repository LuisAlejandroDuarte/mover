import '../../domain/domain.dart';

class CondicionVehiculoRepositorieImpl extends CondicionVehiculoRepositorie {
  final CondicionVehiculoDatasource condicionVehiculoDatasource;

  CondicionVehiculoRepositorieImpl({required this.condicionVehiculoDatasource});

  @override
  Future<List<CondicionVehiculo>> getAllCondicionVehiculo() async {
    return await condicionVehiculoDatasource.getAllCondicionVehiculo();
  }
}
