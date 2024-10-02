import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/domain/domain.dart';
import 'package:frontend/presentation/providers/clase/clase_repository_provider.dart';

final claseProvider = StateNotifierProvider<ClaseNotifier, List<Clases>>((ref) {
  final clase = ref.watch(claseRepositoryProvider);

  return ClaseNotifier(claseRepositories: clase);
});

class ClaseNotifier extends StateNotifier<List<Clases>> {
  final ClaseRepositories claseRepositories;

  ClaseNotifier({required this.claseRepositories}) : super([]);

  Future<void> getClasesByIdCategoria(int idCategoria) async {
    final clases = await claseRepositories.getClaseByIdCategoria(idCategoria);
    state = clases; // Actualiza el estado con las clases obtenidas
  }
}
