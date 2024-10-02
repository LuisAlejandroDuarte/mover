import '../../domain/domain.dart';

class ClaseRepositoriesImpl extends ClaseRepositories {
  final ClaseDatasource claseDatasource;

  ClaseRepositoriesImpl({required this.claseDatasource});

  @override
  Future<List<Clases>> getClaseByIdCategoria(int idCategoria) async {
    return await claseDatasource.getClaseByIdCategoria(idCategoria);
  }
}
