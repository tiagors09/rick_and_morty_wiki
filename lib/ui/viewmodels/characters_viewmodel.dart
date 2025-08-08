import 'package:flutter/material.dart';
import 'package:rick_and_morty_wiki/data/repositories/character.dart/get_all_characters_repository.dart';
import 'package:rick_and_morty_wiki/data/services/character/get_all_characters_service.dart';
import 'package:rick_and_morty_wiki/domain/models/charater.dart';
import 'package:rick_and_morty_wiki/exceptions/api_exception.dart';
import 'package:rick_and_morty_wiki/data/services/character/character_filters.dart';

class CharactersViewmodel extends ChangeNotifier {
  List<Character> characters = [];
  bool isLoading = false;
  String? errorMessage;
  ScrollController scrollController = ScrollController();
  int currentPage = 1;

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
    if (!isLoading &&
        scrollController.position.pixels >=
            scrollController.position.maxScrollExtent) {
      loadMoreCharacters();
    }
  }

  Future<void> loadMoreCharacters() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      currentPage++;

      final newCharacters = await GetAllCharactersRepository(
        service: GetAllCharactersService(
          page: currentPage,
        ),
      ).execute();

      characters.addAll(newCharacters);

      notifyListeners();
    } catch (e) {
      currentPage--;
      errorMessage = e is ApiException ? e.message : 'Erro inesperado';
    }

    isLoading = false;
    notifyListeners();
  }

  void onViewCharacter(BuildContext ctx, Character c) {
    Navigator.of(ctx).pushNamed(
      '/character',
      arguments: c,
    );
  }
}
