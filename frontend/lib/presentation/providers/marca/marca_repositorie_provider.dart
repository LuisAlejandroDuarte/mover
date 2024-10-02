import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/domain.dart';
import '../../../infrastructure/infrastructure.dart';

final marcaRepositorieProvider = Provider<MarcaRepositorie>((ref) {
  final marcaRepositorie =
      MarcaRepositorieImpl(marcaDatasource: MarcaDatasourceImpl());

  return marcaRepositorie;
});
