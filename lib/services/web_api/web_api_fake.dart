import 'dart:convert';

import 'package:braivia/models/difficulty.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:braivia/models/braivia_model.dart';
import 'package:braivia/services/web_api/web_api.dart';

class WebApiFake implements WebApi {
  @override
  Future<List<Trivia>> getTrivia({required Difficulty difficulty}) async {
    final String loadedData = await getData(difficulty);

    BraiviaModel decodedData = BraiviaModel.fromJson(jsonDecode(loadedData));

    return decodedData.responseCode == 0 ? decodedData.results : [];
  }

  Future<String> getData(Difficulty difficulty) async {
    return Future<String>.delayed(const Duration(seconds: 3), () async {
      switch (difficulty) {
        case Difficulty.easy:
          return await rootBundle.loadString('assets/raw_json/easy.json');
        case Difficulty.medium:
          return await rootBundle.loadString('assets/raw_json/medium.json');
        case Difficulty.hard:
          return await rootBundle.loadString('assets/raw_json/hard.json');
      }
    });
  }
}
