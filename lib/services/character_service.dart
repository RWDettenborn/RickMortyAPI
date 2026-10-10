import 'dart:convert';
import 'package:rickandmortyapi/models/list_characters_model.dart';
import 'package:http/http.dart' as http;

import '../models/list_characters_model.dart';

class CharacterService {
  String url = "https://rickandmortyapi.com/api/character";

  Future<ListCharacters> fetchListCharacters() async {
    final response = await http.get(Uri.parse(url));
    print('statusCode: ${response.statusCode}');

    if (response.statusCode == 200) {
      Map<String, dynamic> retorno = json.decode(response.body);
      return ListCharacters.fromJson(retorno);
    } else {
      throw Exception('Falhou ao carregar');
    }
  }
}