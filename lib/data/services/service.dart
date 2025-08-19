import 'package:http/http.dart' as http;

abstract class Service<T> {
  Future<T> execute(http.Client client);
}
