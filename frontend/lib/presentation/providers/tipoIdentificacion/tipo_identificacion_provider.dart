import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain.dart';
import 'tipo_identificacion_repository_provider.dart';

final listTipoIdentificacionProvider = StateNotifierProvider<
    ListTipoIdentificacionNotifier, List<TipoIdentificacion>>((ref) {
  final listTipoIdentificacion =
      ref.watch(tipoIdentificacionRepositoryProvider);

  return ListTipoIdentificacionNotifier(
      tipoIdentificacionRepository: listTipoIdentificacion);
});

class ListTipoIdentificacionNotifier
    extends StateNotifier<List<TipoIdentificacion>> {
  final TipoIdentificacionRepository tipoIdentificacionRepository;
  ListTipoIdentificacionNotifier({required this.tipoIdentificacionRepository})
      : super([]) {
    fetchTiposIdentificacion();
  }

  Future<void> fetchTiposIdentificacion() async {
    try {
      final tipos = await tipoIdentificacionRepository.getAll();
      state = tipos;
    } catch (e) {
      // Manejo de errores, si es necesario
      state = [];
    }
  }
}
