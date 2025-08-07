enum CharacterSpecies {
  human('Human'),
  alien('Alien'),
  empty('');

  final String label;

  const CharacterSpecies(this.label);
}

enum CharacterStatus {
  alive('Alive'),
  unknown('Unknown'),
  dead('Dead'),
  empty('');

  final String label;

  const CharacterStatus(this.label);
}

enum CharacterGender {
  male('Male'),
  female('Female'),
  unknown('Unknown'),
  empty('');

  final String label;

  const CharacterGender(this.label);
}
