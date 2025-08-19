import 'package:http/http.dart' as http;
import 'package:rick_and_morty_wiki/data/services/service.dart';
import 'package:rick_and_morty_wiki/domain/models/episode.dart';

class GetASingleEpisodeService implements Service<Episode> {
  @override
  Future<Episode> execute(http.Client client) {
    // TODO: implement execute
    throw UnimplementedError();
  }
}
