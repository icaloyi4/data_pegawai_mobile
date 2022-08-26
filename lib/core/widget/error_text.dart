import 'package:flutter/cupertino.dart';

class ErrorText extends StatelessWidget {
  final String message;
  final Function? tryAgain;

  const ErrorText({required this.message, this.tryAgain});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          if (tryAgain != null) tryAgain!();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(message),
            SizedBox(
              height: 10,
            ),
            (tryAgain != null)
                ? Icon(
                    CupertinoIcons.refresh_circled_solid,
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
