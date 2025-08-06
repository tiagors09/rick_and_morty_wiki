abstract class Service<T> {
  Future<List<T>> getAll();
  Future<T> getASingle(int id);
  Future<List<T>> getMultiple(String ids);
  Future<List<T>> filter();
}
