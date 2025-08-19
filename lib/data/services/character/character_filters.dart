import 'package:rick_and_morty_wiki/utils/enums.dart';

class CharacterFilters {
  final int? id;
  final String? name;
  final CharacterStatus? status;
  final CharacterSpecies? species;
  final String? type;
  final CharacterGender? gender;

  CharacterFilters({
    this.id = 0,
    this.name = '',
    this.status = CharacterStatus.empty,
    this.species = CharacterSpecies.empty,
    this.type = '',
    this.gender = CharacterGender.empty,
  });
}
