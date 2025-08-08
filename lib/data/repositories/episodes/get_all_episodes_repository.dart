import 'package:rick_and_morty_wiki/data/repositories/repository.dart';
import 'package:rick_and_morty_wiki/data/services/service.dart';
import 'package:rick_and_morty_wiki/domain/models/episode.dart';

class GetAllEpisodesRepository implements Repository<List<Episode>> {
  final Service service;

  GetAllEpisodesRepository({required this.service});

  @override
  Future<List<Episode>> execute() {
    // TODO: implement execute
    throw UnimplementedError();
  }
}
