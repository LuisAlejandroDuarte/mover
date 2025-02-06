import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/domain/domain.dart';

import '../../../infrastructure/infrastructure.dart';

final empresaRepositoryProvider = Provider<EmpresaRespositories>((ref) {
  final empresaRepositorie =
      EmpresaRepositorieImpl(empresaDatasource: EmpresaDatasourceImpl());

  return empresaRepositorie;
});
