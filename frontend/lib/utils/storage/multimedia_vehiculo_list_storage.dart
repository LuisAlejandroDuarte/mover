import '../../domain/domain.dart';
import 'storage_impl.dart';

class MultimediaVehiculoListStorage {
  StorageImpl storageImpl = StorageImpl<MultimediaVehiculo>(
      'MultimediaVehiculoList',
      fromJson: (json) => MultimediaVehiculo.fromJson(json),
      toJson: (vehiculo) => vehiculo.toJson());

  Future<void> delete() async {
    return await storageImpl.delete();
  }

  Future<void> saveList(List<MultimediaVehiculo?>? listEntity) async {
    return await storageImpl.saveList(listEntity);
  }

  Future<List<MultimediaVehiculo?>> getList() async {
    final List<dynamic> rawList = await storageImpl.getList();
    return rawList.map((item) => item as MultimediaVehiculo?).toList();
  }
}
