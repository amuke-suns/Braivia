import 'package:braivia/screens/screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BraiviaApp());
}

class BraiviaApp extends StatelessWidget {
  const BraiviaApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}