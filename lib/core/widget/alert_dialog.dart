import 'package:flutter/material.dart';

void showDialogTwoOption(
  BuildContext context,
  String title,
  String left,
  String right, {
  String message = "",
  required Function(BuildContext ctxnya) onRight,
  required Function(BuildContext ctxnya) onLeft,
}) {
  showDialog(
    context: context,
    builder: (BuildContext ctx) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            child: Text(
              left,
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () {
              onLeft(ctx);
            },
          ),
          TextButton(
            child: Text(right),
            onPressed: () {
              onRight(ctx);
            },
          )
        ],
      );
    },
  );
}
