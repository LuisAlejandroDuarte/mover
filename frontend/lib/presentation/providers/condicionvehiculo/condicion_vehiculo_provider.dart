import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain.dart';
import 'condicion_vehiculo_repositorie_provider.dart';

final condicionVehiculoProvider =
    StateNotifierProvider<CondicionVehiculoNotifier, List<CondicionVehiculo>>(
        (ref) {
  final condicionVehiculo = ref.watch(condicionVehiculoRepositorieProvider);

  return CondicionVehiculoNotifier(
      condicionVehiculoRepositorie: condicionVehiculo);
});

class CondicionVehiculoNotifier extends StateNotifier<List<CondicionVehiculo>> {
  final CondicionVehiculoRepositorie condicionVehiculoRepositorie;

  CondicionVehiculoNotifier({required this.condicionVehiculoRepositorie})
      : super([]);

  Future<void> getAllCondicionVehiculo() async {
    final condicionVehiculos =
        await condicionVehiculoRepositorie.getAllCondicionVehiculo();

    state = condicionVehiculos;
  }
}
