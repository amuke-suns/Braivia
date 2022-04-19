import 'package:flutter/material.dart';

mixin DialogUtilsMixin {
  showLoadingDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: const [
          CircularProgressIndicator(),
          SizedBox(width: 7),
          Text("Loading..."),
        ],
      ),
    );

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void dismissLoadingDialog(BuildContext context) {
    Navigator.pop(context);
  }
}