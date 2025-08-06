abstract class Service<T> {
  Future<List<T>> getAll();
  Future<T> getASingle(int id);
  Future<List<T>> getMultiple();
  Future<List<T>> filter();
}
