import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain.dart';
import '../providers.dart';

final userProvider = StateNotifierProvider.autoDispose
    .family<UserNotifier, UserState, int>((ref, userId) {
  final userRepositorie = ref.watch(userRepositoryProvider);

  return UserNotifier(userId: userId, userRepositorio: userRepositorie);
});

class UserNotifier extends StateNotifier<UserState> {
  final UserRepositorio userRepositorio;

  UserNotifier({required this.userRepositorio, required int userId})
      : super(UserState(id: userId));

  Future<void> addUserNew() async {
    final newUser = await userRepositorio.addUser(state.user!);

    state = state.copyWith(isLoading: false, id: newUser.id, user: newUser);
  }

  Future<User> getById(int id) async {
    return userRepositorio.getById(id);
  }
}

class UserState {
  final int id;
  final User? user;
  final bool isLoading;
  final bool isSaving;

  UserState(
      {required this.id,
      this.user,
      this.isLoading = true,
      this.isSaving = false});

  UserState copyWith({int? id, User? user, bool? isLoading, bool? isSaving}) =>
      UserState(
          id: id ?? this.id,
          user: user ?? this.user,
          isLoading: isLoading ?? this.isLoading,
          isSaving: isSaving ?? this.isLoading);
}
