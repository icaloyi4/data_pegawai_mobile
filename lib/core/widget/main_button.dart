import 'package:flutter/material.dart';
import 'package:ojrek_hris/core/widget/styling.dart';

import '../assets/my_color.dart';
import '../assets/my_enum.dart';

class MainButton extends StatelessWidget {
  final String label;
  final Function? onTap;

  const MainButton({required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          if (onTap != null) onTap!();
        },
        child: Container(
          decoration: styleBoxAllWithColor(colors: MyColors.mainColor),
          child: Text(
            label,
            style: styleHeader(
                color: Colors.white, textStyleWeight: TextStyleWeight.Title3),
          ),
          alignment: Alignment.center,
          height: 50,
        ),
      ),
    );
  }
}
