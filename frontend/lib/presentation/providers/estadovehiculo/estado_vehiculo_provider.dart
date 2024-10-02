import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain.dart';
import 'estado_vehiculo_repositorie_provider.dart';

final estadoVehiculoProvider =
    StateNotifierProvider<EstadoVehiculoNotifier, List<EstadoVehiculo>>((ref) {
  final estadoVehiculo = ref.watch(estadoVehiculoRepositorieProvider);

  return EstadoVehiculoNotifier(estadoVehiculoRepositorie: estadoVehiculo);
});

class EstadoVehiculoNotifier extends StateNotifier<List<EstadoVehiculo>> {
  final EstadoVehiculoRepositorie estadoVehiculoRepositorie;

  EstadoVehiculoNotifier({required this.estadoVehiculoRepositorie}) : super([]);

  Future<void> getAllEstadoVehiculo() async {
    final estadoVehiculos =
        await estadoVehiculoRepositorie.getAllEstadoVehiculo();

    state = estadoVehiculos;
  }
}
