import 'package:flutter/material.dart';
import 'package:rick_and_morty_wiki/ui/views/characters_view.dart';

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CharactersView(),
    );
  }
}
