import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/domain.dart';
import '../../../infrastructure/infrastructure.dart';

final referenciaRepositorieProvider = Provider<ReferenciaRepositorie>((ref) {
  final referenciaRepositorie = ReferenciaRepositorieImpl(
      referenciaDatasource: ReferenciaDatasourceImpl());

  return referenciaRepositorie;
});
