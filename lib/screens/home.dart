import 'package:personagens/components/character_image.dart';
import 'package:personagens/controllers/character_controller.dart';
import 'package:personagens/screens/character_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/character_image.dart';
import '../controllers/character_controller.dart';
import 'character_details.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var controller = CharacterController.character;

  @override
  void initState() {
    super.initState();
    controller.listCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Obx(() => controller.isLoading.value ?
      const Center(child: CircularProgressIndicator()) :
      ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: controller.listCharactersObs.length,
        itemBuilder: (BuildContext context, int index) {
          final character = controller.listCharactersObs[index];
          return Card(
            child: ListTile(
              onTap: () {
                Get.to(() => CharacterDetails(characterModel: character));
              },
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CharacterImage(image: character.image, width: 50),
              ),
              title: Text(character.name),
              subtitle: Text('${character.species} • ${character.status}'),
              trailing: const Icon(Icons.chevron_right),
            ),
          );
        },
      ),
      ),
    );
  }
}