import 'package:rick_and_morty_wiki/data/services/service.dart';
import 'package:rick_and_morty_wiki/domain/models/episode.dart';

class EpisodeService implements Service<Episode> {
  @override
  Future<List<Episode>> filter() {
    // TODO: implement filter
    throw UnimplementedError();
  }

  @override
  Future<Episode> getASingle(int id) {
    // TODO: implement getASingle
    throw UnimplementedError();
  }

  @override
  Future<List<Episode>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<List<Episode>> getMultiple() {
    // TODO: implement getMultiple
    throw UnimplementedError();
  }
}
