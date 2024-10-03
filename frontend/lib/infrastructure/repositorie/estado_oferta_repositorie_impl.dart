import '../../domain/domain.dart';

class EstadoOfertaRepositorieImpl extends EstadoOfertaRepositorie {
  final EstadoOfertaDatasource estadoOfertaDatasource;

  EstadoOfertaRepositorieImpl({required this.estadoOfertaDatasource});

  @override
  Future<List<EstadoOferta>> getAllEstadoOferta() async {
    return await estadoOfertaDatasource.getAllEstadoOferta();
  }
}
