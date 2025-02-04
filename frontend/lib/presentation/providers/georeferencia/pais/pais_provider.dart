import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/domain.dart';
import 'pais_repositorie_provider.dart';

final paisProvider = StateNotifierProvider<PaisNotifier, Pais?>((ref) {
  final pais = ref.watch(paisRepositorieProvider);

  return PaisNotifier(paisRepositorie: pais);
});

class PaisNotifier extends StateNotifier<Pais?> {
  final PaisRepositorie paisRepositorie;

  PaisNotifier({required this.paisRepositorie}) : super(null);

  Future<void> getPaisByCoidgo(String codigo) async {
    final paiss = await paisRepositorie.getPaisByCodigo(codigo);

    state = paiss;
  }
}
