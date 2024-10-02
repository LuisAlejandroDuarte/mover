import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain.dart';
import '../../../infrastructure/infrastructure.dart';

final estadoVehiculoRepositorieProvider =
    Provider<EstadoVehiculoRepositorie>((ref) {
  final estadoVehiculoRepositorie = EstadoVehiculoRepositorieImpl(
      estadoVehiculoDatasource: EstadoVehiculoDatasourceImpl());

  return estadoVehiculoRepositorie;
});
