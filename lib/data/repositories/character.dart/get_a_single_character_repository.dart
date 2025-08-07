import 'package:rick_and_morty_wiki/data/repositories/repository.dart';
import 'package:rick_and_morty_wiki/data/services/service.dart';
import 'package:rick_and_morty_wiki/domain/models/charater.dart';

class GetASingleCharacterRepository implements Repository<Character> {
  final Service service;

  GetASingleCharacterRepository({required this.service});

  @override
  Future<Character> execute() async {
    try {
      final result = await service.execute();

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
