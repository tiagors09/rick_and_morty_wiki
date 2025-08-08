import 'package:flutter/material.dart';
import 'package:rick_and_morty_wiki/domain/models/episode.dart';

class EpisodeGridItem extends StatelessWidget {
  final Episode e;
  final void Function(BuildContext, Episode) onTap;

  const EpisodeGridItem({super.key, required this.e, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () => onTap(context, e),
        child: GridTile(
          footer: GridTileBar(
            title: Text(e.episode),
            backgroundColor: Colors.black87,
          ),
          child: Hero(
            tag: e.id,
            child: FadeInImage.assetNetwork(
              fit: BoxFit.cover,
              placeholder: 'assets/images/placeholder.jpeg',
              image: 'assets/images/placeholder.jpeg',
            ),
          ),
        ),
      ),
    );
  }
}
