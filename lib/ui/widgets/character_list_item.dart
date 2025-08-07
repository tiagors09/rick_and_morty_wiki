import 'package:flutter/material.dart';
import 'package:rick_and_morty_wiki/domain/models/charater.dart';

class CharacterListItem extends StatelessWidget {
  final Character c;

  const CharacterListItem({super.key, required this.c});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: Image.network(c.image),
    );
  }
}
