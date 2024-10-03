import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain.dart';
import 'parametros_vehiculo_repositorie_provider.dart';

final parametrosVehiculoProvider =
    StateNotifierProvider<ParametrosVehiculoNotifier, List<ParametrosVehiculo>>(
        (ref) {
  final parametrosVehiculo = ref.watch(parametrosVehiculoRepositoryProvider);

  return ParametrosVehiculoNotifier(
      parametrosVehiculoRepositorie: parametrosVehiculo);
});

class ParametrosVehiculoNotifier
    extends StateNotifier<List<ParametrosVehiculo>> {
  final ParametrosVehiculoRepositorie parametrosVehiculoRepositorie;

  ParametrosVehiculoNotifier({required this.parametrosVehiculoRepositorie})
      : super([]);

  Future<void> fetchParametrosVehiculos() async {
    final parametrosVehiculos =
        await parametrosVehiculoRepositorie.getAllParametrosVehiculo();
    state = parametrosVehiculos;
  }
}
