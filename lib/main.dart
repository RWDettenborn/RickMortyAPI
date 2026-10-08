import 'package:flutter/material.dart';
import 'services/character_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final list = await CharacterService().fetchCharacters();
  print('Quantidade: ${list.length}');
  print('Primeiro: ${list.first.name}');
  runApp(const MaterialApp(home: Scaffold()));
}