import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/domain/domain.dart';
import 'package:frontend/presentation/providers/clase/clase_repository_provider.dart';

final claseProvider =
    StateNotifierProvider<ClaseNotifier, AsyncValue<List<Clases>>>((ref) {
  final clase = ref.watch(claseRepositoryProvider);
  return ClaseNotifier(claseRepositories: clase);
});

class ClaseNotifier extends StateNotifier<AsyncValue<List<Clases>>> {
  final ClaseRepositories claseRepositories;

  ClaseNotifier({required this.claseRepositories})
      : super(const AsyncValue.loading());

  Future<void> getClasesByIdCategoria(int idCategoria) async {
    try {
      state = const AsyncValue
          .loading(); // Muestra estado de carga mientras se obtienen datos
      final clases = await claseRepositories.getClaseByIdCategoria(idCategoria);
      state = AsyncValue.data(
          clases); // Actualiza el estado con las clases obtenidas
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }
}
