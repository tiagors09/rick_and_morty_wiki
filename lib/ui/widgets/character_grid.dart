import 'package:flutter/material.dart';
import 'package:rick_and_morty_wiki/domain/models/charater.dart';
import 'package:rick_and_morty_wiki/ui/widgets/character_grid_item.dart';

class CharacterGrid extends StatelessWidget {
  final List<Character> characters;
  final ScrollController scrollController;
  final void Function(BuildContext, Character) onViewChar;

  const CharacterGrid({
    super.key,
    required this.characters,
    required this.scrollController,
    required this.onViewChar,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      controller: scrollController,
      itemCount: characters.length,
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => CharacterGridItem(
        c: characters[i],
        onTap: onViewChar,
      ),
    );
  }
}
