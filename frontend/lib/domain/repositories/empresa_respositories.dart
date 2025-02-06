import '../domain.dart';

abstract class EmpresaRespositories {
  Future<Empresa> crearEmpresa(Empresa empresa);
}
