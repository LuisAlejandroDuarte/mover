abstract class Storage<T> {
  final String key;

  Storage(this.key);

  Future<T?> get();
  Future<void> save(T entity);
  Future<void> delete();

  Future<void> saveList(List<T?> list);
  Future<List<T?>> getList();
}
