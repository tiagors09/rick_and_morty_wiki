import 'package:http/http.dart' as http;
import 'package:rick_and_morty_wiki/data/services/service.dart';
import 'package:rick_and_morty_wiki/domain/models/episode.dart';

class GetMultipleEpisodes implements Service<List<Episode>> {
  @override
  Future<List<Episode>> execute(http.Client client) {
    // TODO: implement execute
    throw UnimplementedError();
  }
}
