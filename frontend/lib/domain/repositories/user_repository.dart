import '../domain.dart';

abstract class UserRepositorio {
  Future<List<User>> getUsers();
  Future<User> addUser(User user);
  Future<User> getById(int id);
}
