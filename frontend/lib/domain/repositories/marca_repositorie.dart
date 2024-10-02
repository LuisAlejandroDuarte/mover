import '../domain.dart';

abstract class MarcaRepositorie {
  Future<List<Marca>> getMarcaByIdClase(int idClase);
}
