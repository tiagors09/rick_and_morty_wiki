import 'package:flutter/material.dart';
import 'package:rick_and_morty_wiki/domain/models/charater.dart';

class CharacterGridItem extends StatelessWidget {
  final Character c;

  const CharacterGridItem({super.key, required this.c});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: null,
        child: GridTile(
          footer: GridTileBar(
            title: Text(c.name),
            backgroundColor: Colors.black87,
          ),
          child: Hero(
            tag: c.id,
            child: FadeInImage.assetNetwork(
              fit: BoxFit.cover,
              placeholder: 'assets/images/placeholder.jpeg',
              image: c.image,
            ),
          ),
        ),
      ),
    );
  }
}
