import '../domain.dart';

abstract class CarroceriaRepositorie {
  Future<List<Carroceria>> getCarroceriaByIdClase(int idClase);
}
