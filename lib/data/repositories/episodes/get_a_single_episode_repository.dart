import 'package:rick_and_morty_wiki/data/repositories/repository.dart';
import 'package:rick_and_morty_wiki/data/services/service.dart';
import 'package:rick_and_morty_wiki/domain/models/episode.dart';

class GetASingleEpisodeRepository implements Repository<Episode> {
  final Service service;

  GetASingleEpisodeRepository({required this.service});

  @override
  Future<Episode> execute() {
    // TODO: implement execute
    throw UnimplementedError();
  }
}
