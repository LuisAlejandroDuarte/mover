import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/domain.dart';
import '../../../../infrastructure/infrastructure.dart';

final departamentoRepositorieProvider =
    Provider<DepartamentoRepositorie>((ref) {
  final departamentoRepositorie = DepartamentoRepositorieImpl(
      departamentoDatasource: DepartamentoDatasourceImpl());

  return departamentoRepositorie;
});
