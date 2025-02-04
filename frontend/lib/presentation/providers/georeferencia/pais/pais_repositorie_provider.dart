import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/domain.dart';
import '../../../../infrastructure/infrastructure.dart';

final paisRepositorieProvider = Provider<PaisRepositorie>((ref) {
  final paisRepositorie =
      PaisRepositorieImpl(paisDatasource: PaisDatasourceImpl());

  return paisRepositorie;
});
