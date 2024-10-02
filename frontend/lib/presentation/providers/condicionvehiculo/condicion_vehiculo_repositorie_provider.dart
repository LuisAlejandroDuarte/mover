import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain.dart';
import '../../../infrastructure/infrastructure.dart';

final condicionVehiculoRepositorieProvider =
    Provider<CondicionVehiculoRepositorie>((ref) {
  final condicionVehiculoRepositorie = CondicionVehiculoRepositorieImpl(
      condicionVehiculoDatasource: CondicionVehiculoDatasourceImpl());

  return condicionVehiculoRepositorie;
});
