import '../domain.dart';

abstract class TipoIdentificacionRepository {
  Future<List<TipoIdentificacion>> getAll();
}
