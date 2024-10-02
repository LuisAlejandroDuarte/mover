import '../domain.dart';

abstract class UserDataSource {
  Future<List<User>> getUsers();
  Future<User> addUser(User user);
  Future<User> getById(int id);
}
