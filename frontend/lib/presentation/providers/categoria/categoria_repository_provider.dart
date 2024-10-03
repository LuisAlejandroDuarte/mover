import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain.dart';
import '../../../infrastructure/infrastructure.dart';

final categoriaRepositoryProvider = Provider<CategoriaRepositories>((ref) {
  final categoriaRepositorie =
      CategoriaRepositorieImpl(categoriaDatasource: CategoriaDatasourceImpl());

  return categoriaRepositorie;
});
