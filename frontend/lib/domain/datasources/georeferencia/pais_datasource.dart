import '../../domain.dart';

abstract class PaisDatasource {
  Future<Pais> getPaisByCodigo(String codigo);
}
