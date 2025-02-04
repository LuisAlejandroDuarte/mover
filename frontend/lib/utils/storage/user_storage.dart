import '../../domain/domain.dart';
import 'storage_impl.dart';

class UserStorage {
  StorageImpl<User> storageImpl = StorageImpl<User>('User',
      fromJson: (json) => User.fromJson(json), toJson: (user) => user.toJson());

  Future<void> delete() async {
    return await storageImpl.delete();
  }

  Future<void> save(User entity) async {
    return await storageImpl.save(entity);
  }

  Future<User?> get() async {
    return await storageImpl.get();
  }
}
