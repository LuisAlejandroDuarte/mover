import 'package:frontend/domain/domain.dart';

class EmpresaRepositorieImpl extends EmpresaRespositories {
  final EmpresaDatasource empresaDatasource;
  EmpresaRepositorieImpl({required this.empresaDatasource});

  @override
  Future<Empresa> crearEmpresa(Empresa empresa) async {
    return await empresaDatasource.crearEmpresa(empresa);
  }
}
