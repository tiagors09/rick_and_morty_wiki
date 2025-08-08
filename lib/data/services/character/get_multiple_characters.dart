import 'dart:convert';

import 'package:rick_and_morty_wiki/data/services/service.dart';
import 'package:rick_and_morty_wiki/domain/models/charater.dart';
import 'package:rick_and_morty_wiki/exceptions/api_exception.dart';
import 'package:rick_and_morty_wiki/utils/environment.dart';
import 'package:http/http.dart' as http;

class GetMultipleCharacters implements Service<List<Character>> {
  final String ids;

  GetMultipleCharacters({required this.ids});

  @override
  Future<List<Character>> execute() async {
    try {
      final response = await http.get(
        Uri.parse(
          '${Environment.baseURL}/character/$ids',
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
