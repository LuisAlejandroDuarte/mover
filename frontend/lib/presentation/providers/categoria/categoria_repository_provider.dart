import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/domain/domain.dart';
import 'package:frontend/infrastructure/infrastructure.dart';

final categoriaRepositoryProvider = Provider<CategoriaRepositories>((ref) {
  final categoriaRepositorie =
      CategoriaRepositorieImpl(categoriaDatasource: CategoriaDatasourceImpl());

  return categoriaRepositorie;
});
