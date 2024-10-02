import '../../domain/domain.dart';
import 'storage_impl.dart';

class OfertaStorage {
  StorageImpl<Oferta> storageImpl = StorageImpl<Oferta>('Oferta',
      fromJson: (json) => Oferta.fromJson(json),
      toJson: (oferta) => oferta.toJson());

  Future<void> delete() async {
    return await storageImpl.delete();
  }

  Future<void> save(Oferta entity) async {
    return await storageImpl.save(entity);
  }

  Future<Oferta?> get() async {
    return await storageImpl.get();
  }
}
