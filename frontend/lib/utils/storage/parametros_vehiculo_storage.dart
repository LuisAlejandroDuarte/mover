import '../../domain/domain.dart';
import 'storagex.dart';

class ParametrosVehiculoStorage {
  StorageImpl storageImpl = StorageImpl('ParametrosVehiculo',
      fromJson: (json) => ParametrosVehiculo.fromJson(json),
      toJson: (vehiculo) => vehiculo.toJson());

  Future<void> delete() async {
    return await storageImpl.delete();
  }

  Future<void> saveList(List<ParametrosVehiculo> entity) async {
    return await storageImpl.saveList(entity);
  }

  Future<List<ParametrosVehiculo>?> getList() async {
    final List<dynamic> rawList = await storageImpl.getList();
    return rawList.map((item) => item as ParametrosVehiculo).toList();
  }
}
