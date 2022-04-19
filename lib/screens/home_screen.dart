import 'package:braivia/components/components.dart';
import 'package:braivia/models/braivia_model.dart';
import 'package:braivia/screens/screens.dart';
import 'package:braivia/utils/utils.dart';
import 'package:braivia/viewmodels/viewmodels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with DialogUtilsMixin {
  @override
  void dispose() {
    Provider.of<HomeViewModel>(context, listen: true).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeViewModel>(context, listen: true);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Braivia',
                style: TextStyle(fontSize: 44),
              ),
              Text(
                model.difficulty.name,
                style: const TextStyle(fontSize: 20),
              ),
              Expanded(
                child: Slider(
                  value: model.difficulty.index.toDouble(),
                  onChanged: model.setDifficulty,
                  label: model.difficulty.name,
                  divisions: 2,
                  min: 0,
                  max: 2,
                ),
              ),
              NavButton(
                text: 'START',
                onTap: () async {
                  showLoadingDialog(context);
                  bool isLoaded = await model.loadTrivia();
                  dismissLoadingDialog(context);
                  if (isLoaded) {
                    navigateToTriviaScreen(model.questions);
                  } else {
                    showErrorSnackBar(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToTriviaScreen(List<Trivia> questions) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<TriviaViewModel>(
          create: (_) => TriviaViewModel(questions),
          child: const TriviaScreen(),
        ),
      ),
    );
  }

  void showErrorSnackBar(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('Error occurred. Try again'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
