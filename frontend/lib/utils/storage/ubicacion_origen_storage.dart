import 'package:frontend/domain/domain.dart';

import 'storage_impl.dart';

class UbicacionOrigenStorage {
  StorageImpl<Ubicacion> storageImpl = StorageImpl<Ubicacion>('ubicacionOrigen',
      fromJson: (json) => Ubicacion.fromJson(json),
      toJson: (ubicacion) => ubicacion.toJson());

  Future<void> delete() async {
    return await storageImpl.delete();
  }

  Future<void> save(Ubicacion entity) async {
    return await storageImpl.save(entity);
  }

  Future<Ubicacion?> get() async {
    return await storageImpl.get();
  }
}
