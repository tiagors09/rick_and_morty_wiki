import 'dart:convert';

import 'package:rick_and_morty_wiki/data/services/service.dart';
import 'package:rick_and_morty_wiki/domain/models/charater.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty_wiki/exceptions/api_exception.dart';
import 'package:rick_and_morty_wiki/utils/environment.dart';

class CharacterService implements Service<Character> {
  @override
  Future<List<Character>> filter() {
    // TODO: implement getASingle
    throw UnimplementedError();
  }

  @override
  Future<Character> getASingle(int id) async {
    try {
      final response = await http.get(
        Uri.parse(
          '${Environment.baseURL}/character/$id',
        ),
      );

      final data = jsonDecode(response.body);
      final character = Character.fromJson(data);

      return character;
    } catch (_) {
      throw ApiException('Falha ao obter personagem');
    }
  }

  @override
  Future<List<Character>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<List<Character>> getMultiple(String ids) {
    // TODO: implement getMultiple
    throw UnimplementedError();
  }
}
