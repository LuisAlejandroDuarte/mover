import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain.dart';
import '../../../infrastructure/infrastructure.dart';

//Este repositorie es inmutable
final userRepositoryProvider = Provider<UserRepositorio>((ref) {
  final userRepositorie =
      UserRepositorieImpl(userDataSource: UserDataSourceImpl());

  return userRepositorie;
});
