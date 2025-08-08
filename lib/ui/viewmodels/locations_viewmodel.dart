import 'package:flutter/material.dart';
import 'package:rick_and_morty_wiki/data/repositories/location/get_all_locations_repository.dart';
import 'package:rick_and_morty_wiki/data/services/location/get_all_locations_service.dart';
import 'package:rick_and_morty_wiki/data/services/location/location_filters.dart';
import 'package:rick_and_morty_wiki/domain/models/location.dart';
import 'package:rick_and_morty_wiki/exceptions/api_exception.dart';

class LocationsViewmodel extends ChangeNotifier {
  List<Location> locations = [];
  bool isLoading = false;
  String? errorMessage;
  ScrollController scrollController = ScrollController();
  int currentPage = 1;

  Future<void> fetchAllEpisodes() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      locations = await GetAllLocationsRepository(
        service: GetAllLocationsService(),
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
      locations = await GetAllLocationsRepository(
        service: GetAllLocationsService(
          filters: LocationFilters(
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

      final newEpisodes = await GetAllLocationsRepository(
        service: GetAllLocationsService(
          page: currentPage,
        ),
      ).execute();

      locations.addAll(newEpisodes);

      notifyListeners();
    } catch (e) {
      currentPage--;
      errorMessage = e is ApiException ? e.message : 'Erro inesperado';
    }

    isLoading = false;
    notifyListeners();
  }

  void onViewEpisode(BuildContext ctx, Location l) {
    Navigator.of(ctx).pushNamed(
      '/location',
      arguments: l,
    );
  }
}
