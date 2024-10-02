import '../../domain/domain.dart';

class ReferenciaRepositorieImpl extends ReferenciaRepositorie {
  final ReferenciaDatasource referenciaDatasource;

  ReferenciaRepositorieImpl({required this.referenciaDatasource});

  @override
  Future<List<Referencia>> getReferenciaByIdMarca(int idMarca) async {
    return await referenciaDatasource.getReferenciaByIdMarca(idMarca);
  }
}
