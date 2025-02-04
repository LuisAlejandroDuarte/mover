import '../../../domain/domain.dart';

class CiudadRepositorieImpl extends CiudadRepositorie {
  final CiudadDatasource ciudadDatasource;

  CiudadRepositorieImpl({required this.ciudadDatasource});

  @override
  Future<List<Ciudad>> getCiudadByIdDepartamento(int departamentoId) async {
    return await ciudadDatasource.getCiudadByIdDepartamento(departamentoId);
  }
}
