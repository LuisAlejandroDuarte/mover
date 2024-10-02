import '../domain.dart';

abstract class CarroceriaDatasource {
  Future<List<Carroceria>> getCarroceriaByIdClase(int idClase);
}
