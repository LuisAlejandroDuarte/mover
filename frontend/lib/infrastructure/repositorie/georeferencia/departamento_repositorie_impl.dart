import '../../../domain/domain.dart';

class DepartamentoRepositorieImpl extends DepartamentoRepositorie {
  final DepartamentoDatasource departamentoDatasource;

  DepartamentoRepositorieImpl({required this.departamentoDatasource});

  @override
  Future<List<Departamento>> getDepartamentoByIdPais(int paisId) async {
    return await departamentoDatasource.getDepartamentoByIdPais(paisId);
  }
}
