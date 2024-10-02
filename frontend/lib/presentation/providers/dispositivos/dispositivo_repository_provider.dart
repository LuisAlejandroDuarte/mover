import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain.dart';
import '../../../infrastructure/infrastructure.dart';

final dispositivoRepositoryProvider = Provider<DispositivosRepositories>((ref) {
  final tiposRepositorie = DispositivoRepositorieImpl(
      dispositivosDataSource: DispositivoDatasourceImpl());

  return tiposRepositorie;
});
