import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/domain/domain.dart';

import '../../../infrastructure/infrastructure.dart';

final personaNaturalRepositoryProvider =
    Provider<PersonaNaturalRepositories>((ref) {
  final personaNaturalRepositorie = PersonaNaturalRepositorieImpl(
      personaNaturalDatasource: PersonaNaturalDatasourceImpl());

  return personaNaturalRepositorie;
});
