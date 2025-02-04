import '../../domain.dart';

abstract class PaisRepositorie {
  Future<Pais> getPaisByCodigo(String codigo);
}
