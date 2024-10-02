import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain.dart';
import 'dispositivo_repository_provider.dart';

final dispositivoProvider =
    StateNotifierProvider<DispositivoNotifier, String>((ref) {
  final dispositivo = ref.watch(dispositivoRepositoryProvider);
  return DispositivoNotifier(dispositivoRepositorie: dispositivo);
});

// DispositivoNotifier class
class DispositivoNotifier extends StateNotifier<String> {
  final DispositivosRepositories dispositivoRepositorie;

  DispositivoNotifier({required this.dispositivoRepositorie}) : super('');

  Future<int> addDispositivo(Dispositivos dispositivo) async {
    return dispositivoRepositorie.addDispositivo(dispositivo);
  }

  Future<Dispositivos> getDispositivoByToken(String token) async {
    return dispositivoRepositorie.getDispositivo(token);
  }

  Future<Dispositivos> getDispositivoByDeviceId(String deviceId) async {
    return dispositivoRepositorie.getDispositivoByDeviceId(deviceId);
  }
}
