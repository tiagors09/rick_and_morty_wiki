import 'dart:convert';

import 'package:rick_and_morty_wiki/data/services/location/location_filters.dart';
import 'package:rick_and_morty_wiki/data/services/service.dart';
import 'package:rick_and_morty_wiki/domain/models/location.dart';
import 'package:rick_and_morty_wiki/exceptions/api_exception.dart';
import 'package:rick_and_morty_wiki/utils/environment.dart';
import 'package:http/http.dart' as http;

class GetAllLocationsService implements Service<List<Location>> {
  final LocationFilters? filters;
  final int page;

  GetAllLocationsService({
    this.filters,
    this.page = 1,
  });

  @override
  Future<List<Location>> execute() async {
    try {
      final response = await http.get(
        Uri.parse(
          '${Environment.baseURL}/location/?page=$page&name=${filters?.name ?? ''}',
        ),
      );

      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> results = data['results'];

      List<Location> locations = results
          .map((char) => Location.fromJson(char as Map<String, dynamic>))
          .toList();

      return locations;
    } catch (_) {
      throw ApiException('Falha ao obter personagens');
    }
  }
}
