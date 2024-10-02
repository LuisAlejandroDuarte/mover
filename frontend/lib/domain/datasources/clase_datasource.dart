import '../domain.dart';

abstract class ClaseDatasource {
  Future<List<Clases>> getClaseByIdCategoria(int idCategoria);
}
