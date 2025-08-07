import 'package:rick_and_morty_wiki/data/repositories/repository.dart';
import 'package:rick_and_morty_wiki/data/services/service.dart';
import 'package:rick_and_morty_wiki/domain/models/charater.dart';

class GetMultipleCharactersRepository implements Repository<List<Character>> {
  final Service service;

  GetMultipleCharactersRepository({required this.service});

  @override
  Future<List<Character>> execute() async {
    try {
      final result = await service.execute();

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
