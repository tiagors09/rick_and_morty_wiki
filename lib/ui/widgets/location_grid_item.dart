import 'package:flutter/material.dart';
import 'package:rick_and_morty_wiki/domain/models/location.dart';

class LocationGridItem extends StatelessWidget {
  final Location l;
  final void Function(BuildContext, Location) onTap;

  const LocationGridItem({super.key, required this.l, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () => onTap(context, l),
        child: GridTile(
          footer: GridTileBar(
            title: Text(l.name),
            backgroundColor: Colors.black87,
          ),
          child: Hero(
            tag: l.id,
            child: Image.asset(
              'assets/images/placeholder.jpeg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
