import '../domain.dart';

abstract class UserDataSource {
  Future<List<User>> getUsers();
  Future<User> addUser(User user);
  Future<User> getById(int id);
  Future<bool> editEstadoUser(User user);
}
