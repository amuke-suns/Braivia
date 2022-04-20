import 'package:braivia/models/braivia_model.dart';
import 'package:flutter/material.dart';
import 'package:html_character_entities/html_character_entities.dart';

class TriviaViewModel with ChangeNotifier {
  final List<Trivia> _questions;

  List<Trivia> get questions => List.unmodifiable(_questions);

  TriviaViewModel(List<Trivia> questions) : _questions = questions;

  int _score = 0;
  int get score => _score;

  int _currentIndex = 0;

  bool? _selectedOption;

  bool? get selectedOption => _selectedOption;

  bool get correctAnswer => questions[_currentIndex].correctAnswer;

  String getQuestion() {
    return HtmlCharacterEntities.decode(questions[_currentIndex].question);
  }

  void selectOption(bool selectedOption) {
    if (_selectedOption != null) {
      // ensure that a user can't change selected option
      return;
    }
    _selectedOption = selectedOption;
    notifyListeners();
  }

  Color getColor(bool option) {
    if (selectedOption != null && selectedOption == option) {
      if (correctAnswer == option) {
        _score++;
        return Colors.green;
      } else {
        return Colors.red;
      }
    }
    return Colors.grey;
  }

  Icon? getIcon(bool option) {
    if (selectedOption != null && selectedOption == option) {
      if (correctAnswer == option) {
        return const Icon(
          Icons.check_circle,
          size: 28,
        );
      } else {
        return const Icon(
          Icons.cancel,
          size: 28,
        );
      }
    }
    return null;
  }

  bool canNext() {
    return _currentIndex + 1 < _questions.length;
  }

  void next() {
    _currentIndex++;
    _selectedOption = null;
    notifyListeners();
  }

  String getQuestionNumber() {
    return 'Question ${_currentIndex + 1}/${questions.length}';
  }

  void submit() {
    print('You scored $_score/10');
  }
}
