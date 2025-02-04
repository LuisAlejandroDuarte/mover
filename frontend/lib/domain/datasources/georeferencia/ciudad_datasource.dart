import '../../domain.dart';

abstract class CiudadDatasource {
  Future<List<Ciudad>> getCiudadByIdDepartamento(int departamentoId);
}
