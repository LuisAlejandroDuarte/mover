import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/domain.dart';
import 'referencia_repositorie_provider.dart';

final referenciaProvider =
    StateNotifierProvider<ReferenciaNotifier, List<Referencia>>((ref) {
  final referencia = ref.watch(referenciaRepositorieProvider);

  return ReferenciaNotifier(referenciaRepositorie: referencia);
});

class ReferenciaNotifier extends StateNotifier<List<Referencia>> {
  final ReferenciaRepositorie referenciaRepositorie;

  ReferenciaNotifier({required this.referenciaRepositorie}) : super([]);

  Future<void> getReferenciaByIdClase(int idClase) async {
    final referencia =
        await referenciaRepositorie.getReferenciaByIdMarca(idClase);

    state = referencia;
  }
}
