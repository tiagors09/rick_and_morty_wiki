import 'dart:convert';

import 'package:rick_and_morty_wiki/data/services/service.dart';
import 'package:rick_and_morty_wiki/domain/models/charater.dart';
import 'package:rick_and_morty_wiki/exceptions/api_exception.dart';
import 'package:rick_and_morty_wiki/utils/character_filters.dart';
import 'package:rick_and_morty_wiki/utils/environment.dart';
import 'package:http/http.dart' as http;

class GetAllCharactersService implements Service<List<Character>> {
  final CharacterFilters? filters;

  GetAllCharactersService({this.filters});

  @override
  Future<List<Character>> execute() async {
    try {
      final response = await http.get(
        Uri.parse(
          '${Environment.baseURL}/character/?name=${filters!.name ?? ''}&status=${filters!.status ?? ''}&species=${filters!.species ?? ''}&type=${filters?.type}&gender=${filters?.gender}',
        ),
      );

      Map<String, dynamic> data = jsonDecode(response.body);

      List<Character> characters = data['results']
          .map((char) => Character.fromJson(char))
          .toList();

      return characters;
    } catch (_) {
      throw ApiException('Falha ao obter personagens');
    }
  }
}
