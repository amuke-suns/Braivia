import 'package:flutter/material.dart';

class TriviaControllerButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function() onTap;

  const TriviaControllerButton(
      {Key? key,
        required this.text,
        required this.isSelected,
        required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
      style: TextButton.styleFrom(
        primary: Colors.white,
      ),
      onPressed: isSelected ? () => onTap() : null,
    );
  }
}