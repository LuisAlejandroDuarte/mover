import '../domain.dart';

abstract class EmpresaDatasource {
  Future<Empresa> crearEmpresa(Empresa empresa);
}
