import 'package:braivia/models/braivia_model.dart';
import 'package:braivia/models/difficulty.dart';
import 'package:braivia/services/service_locator.dart';
import 'package:braivia/services/web_api/web_api.dart';
import 'package:flutter/foundation.dart';

class HomeViewModel with ChangeNotifier {
  final WebApi _webService = serviceLocator<WebApi>();

  List<Trivia> _questions = [];
  List<Trivia> get questions => List.unmodifiable(_questions);

  Difficulty _difficulty = Difficulty.easy;

  Difficulty get difficulty => _difficulty;

  void setDifficulty(double value) {
    _difficulty = Difficulty.values[value.toInt()];
    notifyListeners();
  }

  Future<bool> loadTrivia() async {
    _questions = await _webService.getTrivia(difficulty: difficulty);
    return _questions.isNotEmpty;
  }
}
