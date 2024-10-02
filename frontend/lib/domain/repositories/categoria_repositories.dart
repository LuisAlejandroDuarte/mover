import '../domain.dart';

abstract class CategoriaRepositories {
  Future<List<Categorias>> getAllCategorias();
}
