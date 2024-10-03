import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain.dart';
import 'zona_transporter_repositorie_provider.dart';

final zonaTransporterProvider =
    StateNotifierProvider<ZonaTransporterNotifier, List<ZonaTransporter>>(
        (ref) {
  final zonaTransporter = ref.watch(zonaTransporterRepositoryProvider);

  return ZonaTransporterNotifier(zonaTransporterRepositorie: zonaTransporter);
});

class ZonaTransporterNotifier extends StateNotifier<List<ZonaTransporter>> {
  final ZonaTransporterRepositorie zonaTransporterRepositorie;

  ZonaTransporterNotifier({required this.zonaTransporterRepositorie})
      : super([]);

  Future<void> fetchZonaTransporters() async {
    final zonaTransporters =
        await zonaTransporterRepositorie.getAllZonaTransporter();
    state = zonaTransporters;
  }
}
