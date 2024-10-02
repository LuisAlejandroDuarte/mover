import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain.dart';
import 'modelo_repositorie_provider.dart';

final modeloProvider =
    StateNotifierProvider<ModeloNotifier, List<Modelo>>((ref) {
  final modelo = ref.watch(modeloRepositorieProvider);

  return ModeloNotifier(modeloRepositorie: modelo);
});

class ModeloNotifier extends StateNotifier<List<Modelo>> {
  final ModeloRepositorie modeloRepositorie;

  ModeloNotifier({required this.modeloRepositorie}) : super([]);

  Future<void> getAllModelo() async {
    final modelos = await modeloRepositorie.getAllModelo();

    state = modelos;
  }
}
