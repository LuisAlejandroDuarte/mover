import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain.dart';
import '../../../infrastructure/infrastructure.dart';

//Este repositorie es inmutable
final tipoIdentificacionRepositoryProvider =
    Provider<TipoIdentificacionRepository>((ref) {
  final tiposRepositorie = TipoIdentificacionRepositorieImpl(
      tipoIdentificacionDataSource: TipoIdentificacionDataSourceImpl());

  return tiposRepositorie;
});
