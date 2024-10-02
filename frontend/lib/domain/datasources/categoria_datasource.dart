import '../domain.dart';

abstract class CategoriaDatasource {
  Future<List<Categorias>> getAllCategorias();
}
