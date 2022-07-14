import 'package:flutter/material.dart';

import '../../../../core/widget/styling.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Good Morning",
          style: styleHeader(textStyleWeight: TextStyleWeight.Title),
        ),
        Text(
          "Have a good day",
          style: styleHeader(textStyleWeight: TextStyleWeight.subtitle2),
        ),
      ],
    );
  }
}
