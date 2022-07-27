import 'package:flutter/material.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/widget/styling.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Good ${getHour()}",
          style: styleHeader(textStyleWeight: TextStyleWeight.Title),
        ),
        Text(
          "${messageHeader()}",
          style: styleHeader(textStyleWeight: TextStyleWeight.subtitle2),
        ),
      ],
    );
  }
}
