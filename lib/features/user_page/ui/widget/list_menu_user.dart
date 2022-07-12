import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ojrek_hris/core/assets/my_color.dart';

import '../../../../core/widget/styling.dart';

class ListMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            menu(CupertinoIcons.person, "User Profile"),
            menu(CupertinoIcons.person, "User Profile"),
            menu(CupertinoIcons.person, "User Profile"),
            menu(CupertinoIcons.person, "User Profile"),
          ],
        ),
      ),
    );
  }

  Widget menu(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: styleBoxAll(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                icon,
                size: 18,
              ),
              Expanded(
                  child: Text(
                title,
                style: styleHeader(textStyleWeight: TextStyleWeight.body),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
