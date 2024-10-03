import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain.dart';
import '../../../infrastructure/infrastructure.dart';

final estadoOfertaRepositoryProvider = Provider<EstadoOfertaRepositorie>((ref) {
  final estadoOfertaRepositorie = EstadoOfertaRepositorieImpl(
      estadoOfertaDatasource: EstadoOfertaDatasourceImpl());

  return estadoOfertaRepositorie;
});
