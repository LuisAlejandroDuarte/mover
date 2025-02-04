import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain.dart';
import 'carroceria_repositorie_provider.dart';

final carroceriaProvider =
    StateNotifierProvider<CarroceriaNotifier, AsyncValue<List<Carroceria>>>(
        (ref) {
  final carroceria = ref.watch(carroceriaRepositorieProvider);

  return CarroceriaNotifier(carroceriaRepositorie: carroceria);
});

class CarroceriaNotifier extends StateNotifier<AsyncValue<List<Carroceria>>> {
  final CarroceriaRepositorie carroceriaRepositorie;

  CarroceriaNotifier({required this.carroceriaRepositorie})
      : super(const AsyncValue.loading());

  Future<void> getCarroceriaByIdClase(int idClase) async {
    final carrocerias =
        await carroceriaRepositorie.getCarroceriaByIdClase(idClase);

    state = AsyncData(carrocerias);
  }
}
