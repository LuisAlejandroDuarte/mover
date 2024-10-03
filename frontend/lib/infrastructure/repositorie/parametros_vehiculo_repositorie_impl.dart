import '../../domain/domain.dart';

class ParametrosVehiculoRepositorieImpl extends ParametrosVehiculoRepositorie {
  final ParametrosVehiculoDatasource parametrosVehiculoDatasource;

ParametrosVehiculoRepositorieImpl({required this.parametrosVehiculoDatasource});

  @override
  Future<List<ParametrosVehiculo>> getAllParametrosVehiculo() async {
    return await parametrosVehiculoDatasource.getAllParametrosVehiculo();
  }
}
