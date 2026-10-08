import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character_model.dart';

class CharacterService {
  final String url = 'https://rickandmortyapi.com/api/character';

  Future<List<CharacterModel>> fetchCharacters() async {
    final response = await http.get(Uri.parse(url));
    print('statusCode: ${response.statusCode}');

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = json.decode(response.body);
      final List results = body['results'];
      return results.map((item) => CharacterModel.fromJson(item)).toList();
    }else{
      throw Exception('Falha ao carregar (${response.statusCode})');
    }
  }
}
