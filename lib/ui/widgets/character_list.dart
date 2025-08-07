import 'package:flutter/material.dart';
import 'package:rick_and_morty_wiki/domain/models/charater.dart';
import 'package:rick_and_morty_wiki/ui/widgets/character_list_item.dart';

class CharacterList extends StatelessWidget {
  final List<Character> characters;

  const CharacterList({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    return characters.isEmpty
        ? Center(
            child: Text('Não há personagens a serem exibidos'),
          )
        : ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: characters.length,
            itemBuilder: (context, index) => CharacterListItem(
              c: characters[index],
            ),
          );
  }
}
