import 'package:personagens/components/character_image.dart';
import 'package:personagens/models/character_model.dart';
import 'package:flutter/material.dart';

import '../components/character_image.dart';
import '../models/character_model.dart';

class CharacterDetails extends StatefulWidget {
  final CharacterModel characterModel;
  const CharacterDetails({super.key, required this.characterModel});

  @override
  State<CharacterDetails> createState() => _CharacterDetailsState();
}

class _CharacterDetailsState extends State<CharacterDetails> {
  @override
  Widget build(BuildContext context) {
    final c = widget.characterModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CharacterImage(image: c.image, width: 200),
            const SizedBox(height: 20),
            Card(
              child: Column(
                children: [
                  ListTile(title: const Text("Nome"), trailing: Text(c.name)),
                  ListTile(title: const Text("Status"), trailing: Text(c.status)),
                  ListTile(title: const Text("Espécie"), trailing: Text(c.species)),
                  ListTile(title: const Text("Gênero"), trailing: Text(c.gender)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}