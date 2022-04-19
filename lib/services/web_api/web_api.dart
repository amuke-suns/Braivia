import 'package:braivia/models/braivia_model.dart';
import 'package:braivia/models/difficulty.dart';

abstract class WebApi {
  Future<List<Trivia>> getTrivia({required Difficulty difficulty});
}