abstract class Storage<T> {
  final String key;

  Storage(this.key);

  Future<T?> get();
  Future<void> save(T entity);
  Future<void> delete();
}
