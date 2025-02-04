import 'package:frontend/domain/domain.dart';

import 'storage_impl.dart';

class PersonaNaturalStorage {
  StorageImpl<PersonaNatural> storageImpl = StorageImpl<PersonaNatural>(
      'PersonaNatural',
      fromJson: (json) => PersonaNatural.fromJson(json),
      toJson: (oferta) => oferta.toJson());

  Future<void> delete() async {
    return await storageImpl.delete();
  }

  Future<void> save(PersonaNatural entity) async {
    return await storageImpl.save(entity);
  }

  Future<PersonaNatural?> get() async {
    return await storageImpl.get();
  }
}
