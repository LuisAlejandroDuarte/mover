import '../../domain/domain.dart';

class UserRepositorieImpl implements UserRepositorio {
  final UserDataSource userDataSource;

  UserRepositorieImpl({required this.userDataSource});

  @override
  Future<User> addUser(User user) async {
    return await userDataSource.addUser(user);
  }

  @override
  Future<List<User>> getUsers() async {
    return await userDataSource.getUsers();
  }

  @override
  Future<User> getById(int id) async {
    return await userDataSource.getById(id);
  }
}
