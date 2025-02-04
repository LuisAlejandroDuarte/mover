import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/domain.dart';
import 'departamento_repositorie_provider.dart';

final departamentoProvider =
    StateNotifierProvider<DepartamentoNotifier, List<Departamento>>((ref) {
  final departamento = ref.watch(departamentoRepositorieProvider);

  return DepartamentoNotifier(departamentoRepositorie: departamento);
});

class DepartamentoNotifier extends StateNotifier<List<Departamento>> {
  final DepartamentoRepositorie departamentoRepositorie;

  DepartamentoNotifier({required this.departamentoRepositorie}) : super([]);

  Future<void> getDepartamentoByIdPais(int paisId) async {
    final departamentos =
        await departamentoRepositorie.getDepartamentoByIdPais(paisId);

    state = departamentos;
  }
}
