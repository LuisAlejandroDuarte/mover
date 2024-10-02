import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain.dart';
import 'categoria_repository_provider.dart';

final categoriaProvider =
    StateNotifierProvider<CategoriaNotifier, AsyncValue<List<Categorias>>>(
        (ref) {
  final categoria = ref.watch(categoriaRepositoryProvider);

  return CategoriaNotifier(categoriaRepositories: categoria);
});

class CategoriaNotifier extends StateNotifier<AsyncValue<List<Categorias>>> {
  final CategoriaRepositories categoriaRepositories;

  CategoriaNotifier({required this.categoriaRepositories})
      : super(const AsyncValue.loading()) {
    _fetchCategorias();
  }

  Future<void> _fetchCategorias() async {
    try {
      final categorias = await categoriaRepositories.getAllCategorias();
      state = AsyncValue.data(categorias);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
