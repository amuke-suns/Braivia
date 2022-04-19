import 'package:braivia/components/components.dart';
import 'package:braivia/screens/score_screen.dart';
import 'package:braivia/viewmodels/trivia_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TriviaScreen extends StatelessWidget {
  const TriviaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<TriviaViewModel>(builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(8, 50, 8, 8),
            child: Column(
              children: [
                Text(
                  model.getQuestionNumber(),
                  style: const TextStyle(fontSize: 24),
                ),
                const Divider(color: Colors.white),
                Expanded(
                  child: Text(
                    model.getQuestion(),
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                const OptionsCard(),
                model.canNext()
                    ? TriviaControllerButton(
                        text: 'NEXT',
                        isSelected: model.selectedOption != null,
                        onTap: model.next,
                      )
                    : TriviaControllerButton(
                        text: 'SUBMIT',
                        isSelected: model.selectedOption != null,
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => ScoreScreen(score: model.score),
                            ),
                          );
                        },
                      )
              ],
            ),
          );
        }),
      ),
    );
  }
}
