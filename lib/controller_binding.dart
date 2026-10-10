import 'package:rickandmortyapi/controllers/character_controller.dart';
import 'package:get/get.dart';
import 'controllers/character_controller.dart';

class ControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CharacterController>(() => CharacterController());
  }
}