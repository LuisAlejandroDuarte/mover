import '../domain.dart';

abstract class ReferenciaDatasource {
  Future<List<Referencia>> getReferenciaByIdMarca(int idMarca);
}
