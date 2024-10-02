import '../domain.dart';

abstract class ReferenciaRepositorie {
  Future<List<Referencia>> getReferenciaByIdMarca(int idMarca);
}
