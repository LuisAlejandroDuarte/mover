import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain.dart';
import 'estado_oferta_repositorie_provider.dart';

final estadoOfertaProvider =
    StateNotifierProvider<EstadoOfertaNotifier, AsyncValue<List<EstadoOferta>>>(
        (ref) {
  final estadoOferta = ref.watch(estadoOfertaRepositoryProvider);

  return EstadoOfertaNotifier(estadoOfertaRepositorie: estadoOferta);
});

class EstadoOfertaNotifier
    extends StateNotifier<AsyncValue<List<EstadoOferta>>> {
  final EstadoOfertaRepositorie estadoOfertaRepositorie;

  EstadoOfertaNotifier({required this.estadoOfertaRepositorie})
      : super(const AsyncValue.loading()) {
    _fetchEstadoOfertas();
  }

  Future<void> _fetchEstadoOfertas() async {
    try {
      final estadoOfertas = await estadoOfertaRepositorie.getAllEstadoOferta();
      state = AsyncValue.data(estadoOfertas);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
