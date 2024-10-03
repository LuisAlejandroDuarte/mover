import '../domain.dart';

abstract class EstadoOfertaRepositorie {
  Future<List<EstadoOferta>> getAllEstadoOferta();
}
