import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/domain.dart';
import 'marca_repositorie_provider.dart';

final marcaProvider = StateNotifierProvider<MarcaNotifier, List<Marca>>((ref) {
  final marca = ref.watch(marcaRepositorieProvider);

  return MarcaNotifier(marcaRepositorie: marca);
});

class MarcaNotifier extends StateNotifier<List<Marca>> {
  final MarcaRepositorie marcaRepositorie;

  MarcaNotifier({required this.marcaRepositorie}) : super([]);

  Future<void> getmarcaByIdClase(int idClase) async {
    final marcas = await marcaRepositorie.getMarcaByIdClase(idClase);

    state = marcas;
  }
}
