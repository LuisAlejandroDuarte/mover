import '../../domain/domain.dart';

class EstadoVehiculoRepositorieImpl extends EstadoVehiculoRepositorie {
  final EstadoVehiculoDatasource estadoVehiculoDatasource;

  EstadoVehiculoRepositorieImpl({required this.estadoVehiculoDatasource});

  @override
  Future<List<EstadoVehiculo>> getAllEstadoVehiculo() async {
    return await estadoVehiculoDatasource.getAllEstadoVehiculo();
  }
}
