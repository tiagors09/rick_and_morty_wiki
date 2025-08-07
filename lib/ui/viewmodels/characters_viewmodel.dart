import 'package:flutter/material.dart';
import 'package:rick_and_morty_wiki/data/repositories/character.dart/get_all_characters_repository.dart';
import 'package:rick_and_morty_wiki/data/services/character/get_all_characters_service.dart';
import 'package:rick_and_morty_wiki/domain/models/charater.dart';
import 'package:rick_and_morty_wiki/exceptions/api_exception.dart';
import 'package:rick_and_morty_wiki/utils/character_filters.dart';

class CharactersViewmodel extends ChangeNotifier {
  List<Character> characters = [];
  bool isLoading = false;
  String? errorMessage;
  ScrollController scrollController = ScrollController();

  Future<void> fetchAllCharacters() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      characters = await GetAllCharactersRepository(
        service: GetAllCharactersService(),
      ).execute();
      notifyListeners();
    } catch (e) {
      errorMessage = e is ApiException ? e.message : 'Erro inesperado';
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> onFilterChange(String value) async {
    await fetchAllCharactersWithFilters(value);
  }

  Future<void> fetchAllCharactersWithFilters(String value) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      characters = await GetAllCharactersRepository(
        service: GetAllCharactersService(
          filters: CharacterFilters(name: value, type: value),
        ),
      ).execute();
    } catch (e) {
      errorMessage = e is ApiException ? e.message : 'Erro inesperado';
    }

    isLoading = false;
    notifyListeners();
  }

  void maybeLoadMoreCharacters() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent) {
      loadMoreCharacters();
    }
  }

  void loadMoreCharacters() {}
}
