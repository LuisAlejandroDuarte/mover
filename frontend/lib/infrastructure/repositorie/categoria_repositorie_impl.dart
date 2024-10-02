import '../../domain/domain.dart';

class CategoriaRepositorieImpl extends CategoriaRepositories {
  final CategoriaDatasource categoriaDatasource;

  CategoriaRepositorieImpl({required this.categoriaDatasource});

  @override
  Future<List<Categorias>> getAllCategorias() async {
    return await categoriaDatasource.getAllCategorias();
  }
}
