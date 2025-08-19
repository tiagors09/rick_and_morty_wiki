import 'dart:convert';

import 'package:rick_and_morty_wiki/data/services/service.dart';
import 'package:rick_and_morty_wiki/domain/models/charater.dart';
import 'package:rick_and_morty_wiki/exceptions/api_exception.dart';
import 'package:rick_and_morty_wiki/data/services/character/character_filters.dart';
import 'package:rick_and_morty_wiki/utils/environment.dart';
import 'package:http/http.dart' as http;

class GetAllCharactersService implements Service<List<Character>> {
  final CharacterFilters? filters;
  final int page;

  GetAllCharactersService({this.filters, this.page = 1});

  @override
  Future<List<Character>> execute(http.Client client) async {
    try {
      final response = await client.get(
        Uri.parse(
          '${Environment.baseURL}/character/?page=$page&name=${filters?.name ?? ''}',
        ),
      );

      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> results = data['results'];

      List<Character> characters = results
          .map((char) => Character.fromJson(char as Map<String, dynamic>))
          .toList();

      return characters;
    } catch (_) {
      throw ApiException('Falha ao obter personagens');
    }
  }
}
