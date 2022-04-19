class BraiviaModel {
  int responseCode;
  List<Trivia> results;

  BraiviaModel({
    required this.responseCode,
    required this.results,
  });

  factory BraiviaModel.fromJson(Map<String, dynamic> json) => BraiviaModel(
        responseCode: json["response_code"],
        results: List<Trivia>.from(json["results"].map(
          (x) => Trivia.fromJson(x),
        )),
      );

  Map<String, dynamic> toJson() => {
        "response_code": responseCode,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Trivia {
  String question;
  bool correctAnswer;

  Trivia({
    required this.question,
    required this.correctAnswer,
  });

  factory Trivia.fromJson(Map<String, dynamic> json) => Trivia(
        question: json["question"],
        correctAnswer: json["correct_answer"] == 'True' ? true : false,
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "correct_answer": correctAnswer.toString(),
      };
}
