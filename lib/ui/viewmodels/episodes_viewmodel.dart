import 'package:flutter/material.dart';
import 'package:rick_and_morty_wiki/data/repositories/episodes/get_all_episodes_repository.dart';
import 'package:rick_and_morty_wiki/data/services/episodes/get_all_episodes_service.dart';
import 'package:rick_and_morty_wiki/domain/models/episode.dart';
import 'package:rick_and_morty_wiki/exceptions/api_exception.dart';
import 'package:rick_and_morty_wiki/utils/filters/episode_filters.dart';

class EpisodesViewmodel extends ChangeNotifier {
  List<Episode> episodes = [];
  bool isLoading = false;
  String? errorMessage;
  ScrollController scrollController = ScrollController();
  int currentPage = 1;

  Future<void> fetchAllEpisodes() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      episodes = await GetAllEpisodesRepository(
        service: GetAllEpisodesService(),
      ).execute();
      notifyListeners();
    } catch (e) {
      errorMessage = e is ApiException ? e.message : 'Erro inesperado';
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> onFilterChange(String value) async {
    await fetchAllEpisodesWithFilters(value);
  }

  Future<void> fetchAllEpisodesWithFilters(String value) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      episodes = await GetAllEpisodesRepository(
        service: GetAllEpisodesService(
          filters: EpisodeFilters(
            episode: value,
            name: value,
          ),
        ),
      ).execute();
    } catch (e) {
      errorMessage = e is ApiException ? e.message : 'Erro inesperado';
    }

    isLoading = false;
    notifyListeners();
  }

  void maybeLoadMoreEpisodes() {
    if (!isLoading &&
        scrollController.position.pixels >=
            scrollController.position.maxScrollExtent) {
      loadMoreEpisodes();
    }
  }

  Future<void> loadMoreEpisodes() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      currentPage++;

      final newEpisodes = await GetAllEpisodesRepository(
        service: GetAllEpisodesService(),
      ).execute();

      episodes.addAll(newEpisodes);

      notifyListeners();
    } catch (e) {
      currentPage--;
      errorMessage = e is ApiException ? e.message : 'Erro inesperado';
    }

    isLoading = false;
    notifyListeners();
  }

  void onViewEpisode(BuildContext ctx, Episode e) {
    Navigator.of(ctx).pushNamed(
      '/episode',
      arguments: e,
    );
  }
}
