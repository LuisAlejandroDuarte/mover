import '../domain.dart';

abstract class ModeloRepositorie {
  Future<List<Modelo>> getAllModelo();
}
