import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain.dart';
import 'empresa_repository_provider.dart';

final empresaProvider = StateNotifierProvider<EmpresaNotifier, Empresa?>((ref) {
  final empresaRepository = ref.watch(empresaRepositoryProvider);
  return EmpresaNotifier(empresaRepository);
});

class EmpresaNotifier extends StateNotifier<Empresa?> {
  final EmpresaRespositories empresaRepository;

  EmpresaNotifier(this.empresaRepository) : super(null);

  Future<void> createEmpresa(Empresa empresa) async {
    try {
      state =
          null; // Indicar que está en proceso (puedes usar otro tipo de estado)
      final newEmpresa = await empresaRepository.crearEmpresa(empresa);
      state = newEmpresa; // Se actualiza con la empresa creada
    } catch (e) {
      state =
          null; // Manejo del error (puedes cambiarlo a un estado de error si lo prefieres)
      rethrow;
    }
  }
}
