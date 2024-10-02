import '../../domain/domain.dart';

class ModeloRepositorieImpl extends ModeloRepositorie {
  final ModeloDatasource modeloDatasource;

  ModeloRepositorieImpl({required this.modeloDatasource});

  @override
  Future<List<Modelo>> getAllModelo() async {
    return await modeloDatasource.getAllModelo();
  }
}
