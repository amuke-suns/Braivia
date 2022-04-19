import 'dart:convert';

import 'package:braivia/models/braivia_model.dart';
import 'package:braivia/models/difficulty.dart';
import 'package:braivia/services/web_api/web_api.dart';
import 'package:http/http.dart' as http;

class WebApiImpl implements WebApi {

  @override
  Future<List<Trivia>> getTrivia({required Difficulty difficulty}) async {
    final loadedData = await getData(difficulty.name);
    BraiviaModel decodedData = BraiviaModel.fromJson(jsonDecode(loadedData));
    return decodedData.results;
  }

  Future<dynamic> getData(String difficulty) async {
    Uri uri = Uri.https('opentdb.com', '/api.php', {
      'amount': '10',
      'type': 'boolean',
      'difficulty': difficulty
    });

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return;
    }
  }
}
