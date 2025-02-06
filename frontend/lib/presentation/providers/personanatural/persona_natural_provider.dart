import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain.dart';
import 'persona_natural_repository_provider.dart';

final personaNaturalProvider =
    StateNotifierProvider<PersonaNaturalNotifier, PersonaNatural?>((ref) {
  final personaNaturalRepository = ref.watch(personaNaturalRepositoryProvider);
  return PersonaNaturalNotifier(personaNaturalRepository);
});

class PersonaNaturalNotifier extends StateNotifier<PersonaNatural?> {
  final PersonaNaturalRepositories personaNaturalRepository;

  PersonaNaturalNotifier(this.personaNaturalRepository) : super(null);

  Future<void> createPersonaNatural(PersonaNatural personaNatural) async {
    try {
      state =
          null; // Indicar que está en proceso (puedes usar otro tipo de estado)
      final newPersonaNatural =
          await personaNaturalRepository.crearPersonaNatural(personaNatural);
      state = newPersonaNatural; // Se actualiza con la personaNatural creada
    } catch (e) {
      state =
          null; // Manejo del error (puedes cambiarlo a un estado de error si lo prefieres)
      rethrow;
    }
  }
}
