import 'package:rick_and_morty_wiki/data/repositories/repository.dart';
import 'package:rick_and_morty_wiki/domain/models/charater.dart';
import 'package:rick_and_morty_wiki/domain/usecases/usecase.dart';

class GetASingleCharacterUsecase implements Usecase<Character> {
  final Repository<Character> repository;

  GetASingleCharacterUsecase({required this.repository});

  @override
  Future<Character> execute() async {
    try {
      final result = repository.execute();

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
