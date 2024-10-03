import '../domain.dart';

abstract class EstadoOfertaDatasource {
  Future<List<EstadoOferta>> getAllEstadoOferta();
}
