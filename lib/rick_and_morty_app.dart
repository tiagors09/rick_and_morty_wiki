import 'package:flutter/material.dart';
import 'package:rick_and_morty_wiki/ui/views/characters_view.dart';
import 'package:rick_and_morty_wiki/ui/views/episodes_view.dart';
import 'package:rick_and_morty_wiki/ui/views/locations_view.dart';
import 'package:rick_and_morty_wiki/ui/views/selection_menu_view.dart';

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SelectionMenuView(),
      routes: {
        '/characters': (ctx) => CharactersView(),
        '/episodes': (ctx) => EpisodesView(),
        '/locations': (ctx) => LocationsView(),
      },
    );
  }
}
