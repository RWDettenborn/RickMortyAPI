import 'character_model.dart';

class ListCharacters {
  final List<CharacterModel> listCharacters;
  ListCharacters(this.listCharacters);

  ListCharacters.fromJson(Map<String, dynamic> json) :
        listCharacters = List.from(json['results']).map((item) => CharacterModel.fromJson(item)).toList();
}