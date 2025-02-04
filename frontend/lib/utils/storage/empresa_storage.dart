import 'package:frontend/domain/domain.dart';

import 'storage_impl.dart';

class EmpresaStorage {
  StorageImpl<Empresa> storageImpl = StorageImpl<Empresa>('Empresa',
      fromJson: (json) => Empresa.fromJson(json),
      toJson: (oferta) => oferta.toJson());

  Future<void> delete() async {
    return await storageImpl.delete();
  }

  Future<void> save(Empresa entity) async {
    return await storageImpl.save(entity);
  }

  Future<Empresa?> get() async {
    return await storageImpl.get();
  }
}
