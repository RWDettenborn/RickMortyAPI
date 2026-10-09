import 'package:personagens/models/character_model.dart';
import 'package:personagens/services/character_service.dart';
import 'package:get/get.dart';

import '../models/character_model.dart';
import '../services/character_service.dart';

class CharacterController extends GetxController {

  CharacterService characterService = CharacterService();

  var isLoading = false.obs;

  var listCharactersObs = <CharacterModel>[].obs;

  static CharacterController get character => Get.find();

  Future<dynamic> listCharacters() async {
    isLoading.value = true;
    try {
      var list = await characterService.fetchListCharacters();
      listCharactersObs.value = list.listCharacters;
      print('Controller recebeu ${listCharactersObs.length} personagens');
    } catch (e) {
      print('Erro: $e');
    } finally {
      isLoading.value = false;
    }
    return listCharactersObs;
  }
}