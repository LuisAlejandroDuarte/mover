import '../../../domain/domain.dart';
import '../storage_impl.dart';

class DepartamentoStorage {
  StorageImpl<Departamento> storageImpl = StorageImpl<Departamento>(
      'Departamento',
      fromJson: (json) => Departamento.fromJson(json),
      toJson: (oferta) => oferta.toJson());

  Future<void> delete() async {
    return await storageImpl.delete();
  }

  Future<void> save(Departamento entity) async {
    return await storageImpl.save(entity);
  }

  Future<void> saveList(List<Departamento> listEntity) async {
    return await storageImpl.saveList(listEntity);
  }

  Future<List<Departamento?>> getList() async {
    return await storageImpl.getList();
  }

  Future<Departamento?> get() async {
    return await storageImpl.get();
  }
}
