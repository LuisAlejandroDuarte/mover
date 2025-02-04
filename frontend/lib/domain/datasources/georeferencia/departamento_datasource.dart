import '../../domain.dart';

abstract class DepartamentoDatasource {
  Future<List<Departamento>> getDepartamentoByIdPais(int paisId);
}
