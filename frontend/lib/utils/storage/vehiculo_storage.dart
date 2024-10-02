import '../../domain/entities/vehiculo.dart';
import 'storagex.dart';

class VehiculoStorage {
  StorageImpl storageImpl = StorageImpl('Vehiculo',
      fromJson: (json) => Vehiculo.fromJson(json),
      toJson: (vehiculo) => vehiculo.toJson());

  Future<void> delete() async {
    return await storageImpl.delete();
  }

  Future<void> save(Vehiculo entity) async {
    return await storageImpl.save(entity);
  }

  Future<Vehiculo?> get() async {
    return await storageImpl.get();
  }
}
