import 'package:flutter/material.dart';
import 'package:rick_and_morty_wiki/ui/viewmodels/characters_viewmodel.dart';
import 'package:rick_and_morty_wiki/ui/widgets/filter_text_field.dart';
import 'package:rick_and_morty_wiki/ui/widgets/character_grid.dart';

class CharactersView extends StatefulWidget {
  const CharactersView({super.key});

  @override
  State<CharactersView> createState() => _CharactersViewState();
}

class _CharactersViewState extends State<CharactersView> {
  final viewModel = CharactersViewmodel();

  @override
  void initState() {
    super.initState();
    viewModel.fetchAllCharacters();
    viewModel.addListener(() {
      setState(() {});
    });
    viewModel.scrollController.addListener(() {
      viewModel.maybeLoadMoreCharacters();
    });
  }

  @override
  void dispose() {
    viewModel.removeListener(() {});
    viewModel.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Characters'),
        bottom: FilterTextField(
          onChange: viewModel.onFilterChange,
        ),
      ),
      body: viewModel.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : viewModel.errorMessage != null
          ? Center(
              child: Text(
                viewModel.errorMessage!,
              ),
            )
          : RefreshIndicator(
              onRefresh: () => viewModel.fetchAllCharacters(),
              child: CharacterGrid(
                characters: viewModel.characters,
                scrollController: viewModel.scrollController,
                onViewChar: viewModel.onViewCharacter,
              ),
            ),
    );
  }
}
