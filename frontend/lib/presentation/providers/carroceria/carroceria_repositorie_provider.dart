import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain.dart';
import '../../../infrastructure/infrastructure.dart';

final carroceriaRepositorieProvider = Provider<CarroceriaRepositorie>((ref) {
  final carroceriaRepositorie = CarroceriaRepositorieImpl(
      carroceriaDatasource: CarroceriaDatasourceImpl());

  return carroceriaRepositorie;
});
