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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}