import 'package:flutter/material.dart';
import 'package:ojrek_hris/core/assets/my_color.dart';
import 'package:ojrek_hris/core/assets/my_cons.dart';

import '../../../core/widget/styling.dart';
import 'widget/list_menu_user.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPage createState() => _UserPage();
}

class _UserPage extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyCons.darkModeEnabled ? Colors.blueGrey : MyColors.mainColor,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            color:
                MyCons.darkModeEnabled ? Colors.blueGrey : MyColors.mainColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white, // border color
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "RH",
                    style: styleHeader(
                        color: MyCons.darkModeEnabled
                            ? Colors.blueGrey
                            : MyColors.mainColor,
                        textStyleWeight: TextStyleWeight.Title),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 2),
                  child: Text(
                    "Rizky Haris Risaldi",
                    style: styleHeader(
                        color: Colors.white,
                        textStyleWeight: TextStyleWeight.Title3),
                  ),
                ),
                Text(
                  "Human Resource Supervisor",
                  style: styleHeader(
                      color: Colors.white,
                      textStyleWeight: TextStyleWeight.body),
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            color: MyCons.darkModeEnabled
                ? Colors.blueGrey[400]
                : Colors.grey[200],
            child: ListMenu(),
          ))
        ],
      ),
    );
  }
}
