import '../domain.dart';

abstract class MarcaDatasource {
  Future<List<Marca>> getMarcaByIdClase(int idClase);
}
