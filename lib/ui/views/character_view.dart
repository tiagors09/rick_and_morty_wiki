import 'package:flutter/material.dart';
import 'package:rick_and_morty_wiki/domain/models/charater.dart';

class CharacterView extends StatelessWidget {
  const CharacterView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = ModalRoute.of(context)?.settings.arguments as Character;

    return Scaffold(
      appBar: AppBar(
        title: Text(c.name),
      ),
      body: Column(
        spacing: 16,
        children: [
          Image.network(
            c.image,
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.5,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: Text(
              '${c.name} is a ${c.type.isNotEmpty ? "${c.type} " : ""}${c.species}, currently ${c.status}, of gender ${c.gender}, originally from ${c.origin.name}. Currently located in ${c.location.name}.',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
