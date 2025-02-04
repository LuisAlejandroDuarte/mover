import '../../domain/domain.dart';

class UbicacionRepositorieImpl extends UbicacionRepositorie {
  final UbicacionDatasource ubicacionDatasource;

  UbicacionRepositorieImpl({required this.ubicacionDatasource});

  @override
  Future<int> createUbicacion(Ubicacion ubicacion) async {
    return await ubicacionDatasource.createUbicacion(ubicacion);
  }
}
