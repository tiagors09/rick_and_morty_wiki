import 'package:rick_and_morty_wiki/data/services/service.dart';
import 'package:rick_and_morty_wiki/domain/models/location.dart';

class LocationService implements Service<Location> {
  @override
  Future<List<Location>> filter() {
    // TODO: implement filter
    throw UnimplementedError();
  }

  @override
  Future<Location> getASingle(int id) {
    // TODO: implement getASingle
    throw UnimplementedError();
  }

  @override
  Future<List<Location>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<List<Location>> getMultiple(String ids) {
    // TODO: implement getMultiple
    throw UnimplementedError();
  }
}
