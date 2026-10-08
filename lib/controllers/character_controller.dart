import 'package:get/get.dart';
import '../models/character_model.dart';
import '../services/character_service.dart';

class CharacterController extends GetxController {
  final CharacterService _service = CharacterService();

  var isLoading = false.obs;
  var characters = <CharacterModel>[].obs;

  static CharacterController get to => Get.find();

  Future<void> fetchCharacters() async{
    isLoading.value = true;
    try {
      characters.value = await _service.fetchCharacters();
      print('Controller recebeu ${characters.length} personagens');
    }catch (e) {
      print('Erro: $e');
    } finally {
      isLoading.value = false;
    }
  }
}