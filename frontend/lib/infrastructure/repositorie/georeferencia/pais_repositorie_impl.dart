import '../../../domain/domain.dart';

class PaisRepositorieImpl extends PaisRepositorie {
  final PaisDatasource paisDatasource;

  PaisRepositorieImpl({required this.paisDatasource});

  @override
  Future<Pais> getPaisByCodigo(String codigo) async {
    return await paisDatasource.getPaisByCodigo(codigo);
  }
}
