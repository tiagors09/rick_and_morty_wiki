import 'dart:convert';

import 'package:rick_and_morty_wiki/data/services/character/character_filters.dart';
import 'package:rick_and_morty_wiki/data/services/service.dart';
import 'package:rick_and_morty_wiki/domain/models/charater.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty_wiki/exceptions/api_exception.dart';
import 'package:rick_and_morty_wiki/exceptions/character_not_found_exception.dart';
import 'package:rick_and_morty_wiki/exceptions/id_not_provided_exception.dart';
import 'package:rick_and_morty_wiki/utils/environment.dart';

class GetASingleCharacterService implements Service<Character> {
  final CharacterFilters characterFilters;

  GetASingleCharacterService({
    required this.characterFilters,
  });

  @override
  Future<Character> execute(http.Client client) async {
    try {
      final response = await client.get(
        Uri.parse(
          '${Environment.baseURL}/character/${characterFilters.id}',
        ),
      );

      final data = jsonDecode(response.body);

      if (data['error'] == 500) {
        throw IdNotProvidedException(
          'Olá! Você deve fornecer um número de identificação do personagem!',
        );
      }

      if (data['error'] == 404) {
        throw CharacterNotFoundException('Personagem não encontrado.');
      }

      final character = Character.fromJson(data);

      return character;
    } catch (_) {
      throw ApiException('Falha ao obter personagem');
    }
  }
}
