import '../../domain/entities/vehiculo.dart';
import 'storage_impl.dart';

class VehiculoListStorage {
  StorageImpl storageImpl = StorageImpl<Vehiculo>('VehiculoList',
      fromJson: (json) => Vehiculo.fromJson(json),
      toJson: (vehiculo) => vehiculo.toJson());

  Future<void> delete() async {
    return await storageImpl.delete();
  }

  Future<void> saveList(List<Vehiculo?> listEntity) async {
    return await storageImpl.saveList(listEntity);
  }

  Future<List<Vehiculo?>> getList() async {
    final List<dynamic> rawList = await storageImpl.getList();
    return rawList.map((item) => item as Vehiculo?).toList();
  }
}
