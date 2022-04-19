import 'package:braivia/utils/constants.dart';
import 'package:braivia/viewmodels/viewmodels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OptionsCard extends StatelessWidget {
  const OptionsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TriviaViewModel>(context, listen: true);

    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: kTopCurveDecoration.copyWith(
              color: model.getColor(true),
            ),
            child: ListTile(
              title: getOptionText('TRUE'),
              trailing: model.getIcon(true),
              onTap: () => model.selectOption(true),
            ),
          ),
          const SizedBox(height: 1),
          Container(
            decoration: kBottomCurveDecoration.copyWith(
              color: model.getColor(false),
            ),
            child: ListTile(
              title: getOptionText('FALSE'),
              onTap: () => model.selectOption(false),
              trailing: model.getIcon(false),
            ),
          ),
        ],
      ),
    );
  }

  Text getOptionText(String option) => Text(
    option,
    style: const TextStyle(
      fontSize: 20,
    ),
  );
}