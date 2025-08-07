import 'package:rick_and_morty_wiki/data/repositories/repository.dart';
import 'package:rick_and_morty_wiki/domain/models/charater.dart';
import 'package:rick_and_morty_wiki/domain/usecases/usecase.dart';

class GetMultipleCharactersUsecase implements Usecase<List<Character>> {
  final Repository<List<Character>> repository;

  GetMultipleCharactersUsecase({required this.repository});

  @override
  Future<List<Character>> execute() async {
    try {
      final result = repository.execute();

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
