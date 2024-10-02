import '../../domain/domain.dart';

class CarroceriaRepositorieImpl extends CarroceriaRepositorie {
  final CarroceriaDatasource carroceriaDatasource;

  CarroceriaRepositorieImpl({required this.carroceriaDatasource});

  @override
  Future<List<Carroceria>> getCarroceriaByIdClase(int idClase) async {
    return await carroceriaDatasource.getCarroceriaByIdClase(idClase);
  }
}
