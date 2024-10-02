import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain.dart';
import '../../../infrastructure/infrastructure.dart';

final modeloRepositorieProvider = Provider<ModeloRepositorie>((ref) {
  final modeloRepositorie =
      ModeloRepositorieImpl(modeloDatasource: ModeloDatasourceImpl());

  return modeloRepositorie;
});
