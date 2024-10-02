import '../../domain/domain.dart';

class MarcaRepositorieImpl extends MarcaRepositorie {
  final MarcaDatasource marcaDatasource;

  MarcaRepositorieImpl({required this.marcaDatasource});

  @override
  Future<List<Marca>> getMarcaByIdClase(int idClase) async {
    return await marcaDatasource.getMarcaByIdClase(idClase);
  }
}
