import '../../domain.dart';

abstract class DepartamentoRepositorie {
  Future<List<Departamento>> getDepartamentoByIdPais(int paisId);
}
