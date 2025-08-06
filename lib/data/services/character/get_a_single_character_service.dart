import 'dart:convert';

import 'package:rick_and_morty_wiki/data/services/service.dart';
import 'package:rick_and_morty_wiki/domain/models/charater.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty_wiki/exceptions/api_exception.dart';
import 'package:rick_and_morty_wiki/utils/environment.dart';

class GetASingleCharacterService implements Service<Character> {
  final int id;

  GetASingleCharacterService({required this.id});

  @override
  Future<Character> execute() async {
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
}
