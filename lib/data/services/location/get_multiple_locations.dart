import 'package:http/http.dart' as http;
import 'package:rick_and_morty_wiki/data/services/service.dart';
import 'package:rick_and_morty_wiki/domain/models/location.dart';

class GetMultipleLocations implements Service<List<Location>> {
  @override
  Future<List<Location>> execute(http.Client client) {
    // TODO: implement execute
    throw UnimplementedError();
  }
}
