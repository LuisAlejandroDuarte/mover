import '../domain.dart';

abstract class ClaseRepositories {
  Future<List<Clases>> getClaseByIdCategoria(int idCategoria);
}
