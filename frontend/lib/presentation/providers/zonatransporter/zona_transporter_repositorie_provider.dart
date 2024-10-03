import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain.dart';
import '../../../infrastructure/infrastructure.dart';

final zonaTransporterRepositoryProvider =
    Provider<ZonaTransporterRepositorie>((ref) {
  final zonaTransporterRepositorie = ZonaTransporterRepositorieImpl(
      zonaTransporterDatasource: ZonaTransporterDatasourceImpl());

  return zonaTransporterRepositorie;
});
