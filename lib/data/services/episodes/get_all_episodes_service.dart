import 'dart:convert';

import 'package:rick_and_morty_wiki/data/services/service.dart';
import 'package:rick_and_morty_wiki/domain/models/episode.dart';
import 'package:rick_and_morty_wiki/exceptions/api_exception.dart';
import 'package:rick_and_morty_wiki/utils/environment.dart';
import 'package:rick_and_morty_wiki/utils/filters/episode_filters.dart';
import 'package:http/http.dart' as http;

class GetAllEpisodesService implements Service<List<Episode>> {
  final EpisodeFilters? filters;
  final int page;

  GetAllEpisodesService({
    this.filters,
    this.page = 1,
  });

  @override
  Future<List<Episode>> execute() async {
    try {
      final response = await http.get(
        Uri.parse(
          '${Environment.baseURL}/episode/?name=${filters?.name ?? ''}',
        ),
      );

      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> results = data['results'];

      List<Episode> episodes = results
          .map((char) => Episode.fromJson(char as Map<String, dynamic>))
          .toList();

      return episodes;
    } catch (_) {
      throw ApiException('Falha ao obter personagens');
    }
  }
}
