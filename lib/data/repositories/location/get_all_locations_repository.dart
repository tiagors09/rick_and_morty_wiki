import 'package:rick_and_morty_wiki/data/repositories/repository.dart';
import 'package:rick_and_morty_wiki/data/services/service.dart';
import 'package:rick_and_morty_wiki/domain/models/location.dart';

class GetAllLocationsRepository implements Repository<List<Location>> {
  final Service service;

  GetAllLocationsRepository({required this.service});

  @override
  Future<List<Location>> execute() async {
    try {
      final result = await service.execute();

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
