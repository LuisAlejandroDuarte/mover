import '../domain.dart';

abstract class TipoIdentificacionDataSource {
  Future<List<TipoIdentificacion>> getAll();
}
