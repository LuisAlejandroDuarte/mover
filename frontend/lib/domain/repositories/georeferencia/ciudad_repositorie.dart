import '../../domain.dart';

abstract class CiudadRepositorie {
  Future<List<Ciudad>> getCiudadByIdDepartamento(int departamentoId);
}
