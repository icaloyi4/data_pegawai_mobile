import 'package:flutter/cupertino.dart';

class ErrorText extends StatelessWidget {
  final String message;
  final Function tryAgain;

  const ErrorText({required this.message, required this.tryAgain});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          tryAgain();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(message),
            SizedBox(
              height: 10,
            ),
            Icon(
              CupertinoIcons.refresh_circled_solid,
            )
          ],
        ),
      ),
    );
  }
}
