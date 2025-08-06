import 'package:rick_and_morty_wiki/data/services/service.dart';
import 'package:rick_and_morty_wiki/domain/models/charater.dart';

class CharacterService implements Service<Character> {
  @override
  Future<List<Character>> filter() {
    // TODO: implement filter
    throw UnimplementedError();
  }

  @override
  Future<Character> getASingle(int id) {
    // TODO: implement getASingle
    throw UnimplementedError();
  }

  @override
  Future<List<Character>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<List<Character>> getMultiple() {
    // TODO: implement getMultiple
    throw UnimplementedError();
  }
}
