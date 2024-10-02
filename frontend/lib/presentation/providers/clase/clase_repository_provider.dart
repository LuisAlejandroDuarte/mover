import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/infrastructure/datasource/clase_datasource_impl.dart';

import '../../../domain/domain.dart';
import '../../../infrastructure/repositorie/repositories.dart';

final claseRepositoryProvider = Provider<ClaseRepositories>((ref) {
  final claseRepositorie =
      ClaseRepositoriesImpl(claseDatasource: ClaseDatasourceImpl());

  return claseRepositorie;
});
