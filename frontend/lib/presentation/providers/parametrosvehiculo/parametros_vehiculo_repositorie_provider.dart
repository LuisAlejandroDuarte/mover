import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain.dart';
import '../../../infrastructure/infrastructure.dart';

final parametrosVehiculoRepositoryProvider =
    Provider<ParametrosVehiculoRepositorie>((ref) {
  final parametrosVehiculoRepositorie = ParametrosVehiculoRepositorieImpl(
      parametrosVehiculoDatasource: ParametrosVehiculoDatasourceImpl());

  return parametrosVehiculoRepositorie;
});
