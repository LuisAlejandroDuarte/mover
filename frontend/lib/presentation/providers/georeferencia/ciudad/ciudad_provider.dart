import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/domain.dart';
import 'ciudad_repositorie_provider.dart';

final ciudadProvider =
    StateNotifierProvider<CiudadNotifier, List<Ciudad>>((ref) {
  final ciudad = ref.watch(ciudadRepositorieProvider);

  return CiudadNotifier(ciudadRepositorie: ciudad);
});

class CiudadNotifier extends StateNotifier<List<Ciudad>> {
  final CiudadRepositorie ciudadRepositorie;

  CiudadNotifier({required this.ciudadRepositorie}) : super([]);

  Future<void> getCiudadByIdDepartamento(int departamentoId) async {
    final ciudads =
        await ciudadRepositorie.getCiudadByIdDepartamento(departamentoId);

    state = ciudads;
  }
}
