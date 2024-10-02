import '../../domain/domain.dart';

class TipoIdentificacionRepositorieImpl
    implements TipoIdentificacionRepository {
  final TipoIdentificacionDataSource tipoIdentificacionDataSource;

  TipoIdentificacionRepositorieImpl(
      {required this.tipoIdentificacionDataSource});

  @override
  Future<List<TipoIdentificacion>> getAll() async {
    return await tipoIdentificacionDataSource.getAll();
  }
}
