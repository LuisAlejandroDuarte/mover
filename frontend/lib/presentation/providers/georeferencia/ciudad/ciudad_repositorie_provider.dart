import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/domain.dart';
import '../../../../infrastructure/infrastructure.dart';

final ciudadRepositorieProvider = Provider<CiudadRepositorie>((ref) {
  final ciudadRepositorie =
      CiudadRepositorieImpl(ciudadDatasource: CiudadDatasourceImpl());

  return ciudadRepositorie;
});
