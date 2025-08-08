import 'package:rick_and_morty_wiki/data/repositories/repository.dart';
import 'package:rick_and_morty_wiki/data/services/service.dart';
import 'package:rick_and_morty_wiki/domain/models/location.dart';

class GetASingleLocationRepository implements Repository<Location> {
  final Service service;

  GetASingleLocationRepository({required this.service});

  @override
  Future<Location> execute() async {
    try {
      final result = await service.execute();

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
