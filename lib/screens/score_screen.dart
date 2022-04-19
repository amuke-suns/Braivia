import 'package:braivia/components/components.dart';
import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  final int score;

  const ScoreScreen({
    Key? key,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Score: $score/10',
              style: const TextStyle(
                fontSize: 44,
              ),
            ),
            Text(
              getScoreRemark(score),
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const Divider(color: Colors.white),
            NavButton(
              onTap: () => Navigator.pop(context),
              text: 'GO HOME',
            ),
          ],
        ),
      ),
    );
  }

  String getScoreRemark(int score) {
    if (score == 0) {
      return 'Poor💔';
    }
    if (score < 5) {
      return 'Below average🙃';
    }
    if (score == 5) {
      return 'Average🤝';
    }
    if (score < 10) {
      return 'Very good❤';
    }
    return 'Excellent💯';
  }
}
