import '../domain.dart';

abstract class ModeloDatasource {
  Future<List<Modelo>> getAllModelo();
}
