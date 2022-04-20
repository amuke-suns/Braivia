import 'package:braivia/screens/screens.dart';
import 'package:braivia/services/service_locator.dart';
import 'package:braivia/viewmodels/trivia_viewmodel.dart';
import 'package:braivia/viewmodels/viewmodels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setupServiceLocator();
  runApp(const BraiviaApp());
}

class BraiviaApp extends StatelessWidget {
  const BraiviaApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Braivia',
        theme: ThemeData.dark().copyWith(
          textTheme: ThemeData.dark().textTheme.apply(
                fontFamily: 'SecularOne',
              ),
          primaryTextTheme: ThemeData.dark().textTheme.apply(
                fontFamily: 'SecularOne',
              ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
