import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ojrek_hris/core/assets/my_color.dart';
import 'package:ojrek_hris/core/routing/page_routing.dart';

import '../../../../core/assets/my_cons.dart';
import '../../../../core/widget/styling.dart';

class ListMenu extends StatelessWidget {
  late BuildContext _buildContext;
  @override
  Widget build(BuildContext context) {
    _buildContext = context;
    return SingleChildScrollView(
      child: Column(
        children: [
          // menu(CupertinoIcons.person, "Company Profile"),
          Container(
            color: MyCons.darkModeEnabled ? Colors.blueGrey[200] : Colors.white,
            child: ExpansionTile(
              title: textWithIcon(
                  icon: CupertinoIcons.building_2_fill,
                  iconCustomColor: MyCons.darkModeEnabled
                      ? Colors.blueGrey
                      : MyColors.mainColor,
                  text: "Company Profile"),
              children: [
                listItem("Company", "Lunartecno.id"),
                listItem("Address", "Jalan Sidarta Gautama 17, Bali"),
                listItem("Department", "Human Resource Department"),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: MyCons.darkModeEnabled ? Colors.blueGrey[200] : Colors.white,
            child: ExpansionTile(
              title: textWithIcon(
                  icon: CupertinoIcons.person_alt,
                  iconCustomColor: MyCons.darkModeEnabled
                      ? Colors.blueGrey
                      : MyColors.mainColor,
                  text: "User Profile"),
              children: [
                listItem("Company", "Lunartecno.id"),
                listItem("Address", "Jalan Sidarta Gautama 17, Bali"),
                listItem("Department", "Human Resource Department"),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              color: MyCons.darkModeEnabled ? Colors.grey[200] : Colors.white,
              child: Column(
                children: [
                  Container(
                    decoration: styleBoxUnderline(color: Colors.blueGrey[200]),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: textWithIcon(
                          icon: CupertinoIcons.question_circle_fill,
                          iconCustomColor: MyCons.darkModeEnabled
                              ? Colors.blueGrey
                              : MyColors.mainColor,
                          text: "Frequently Ask & Questions"),
                    ),
                  ),
                  Container(
                    decoration: styleBoxUnderline(color: Colors.blueGrey[200]),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: textWithIcon(
                          icon: CupertinoIcons.refresh_circled_solid,
                          iconCustomColor: MyCons.darkModeEnabled
                              ? Colors.blueGrey
                              : MyColors.mainColor,
                          text: "Reset Password"),
                    ),
                  ),
                  Container(
                    decoration: styleBoxUnderline(color: Colors.blueGrey[200]),
                    child: GestureDetector(
                      onTap: () {
                        Get.offAllNamed(PageRouting.LOGIN);
                      },
                      child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: textWithIcon(
                              icon: CupertinoIcons.square_arrow_left_fill,
                              iconCustomColor: MyCons.darkModeEnabled
                                  ? Colors.blueGrey
                                  : MyColors.mainColor,
                              text: "Sign Out",
                              textStyle: styleHeader(color: Colors.red))),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget menu(IconData icon, String title) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: MyCons.darkModeEnabled ? Colors.blueGrey : MyColors.mainColor,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: Text(
          title,
          style: styleHeader(textStyleWeight: TextStyleWeight.body),
        ))
      ],
    );
  }

  Widget listItem(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: styleBoxUnderline(color: Colors.transparent),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(_buildContext).size.width * 0.2,
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                subtitle,
                style: styleHeader(textStyleWeight: TextStyleWeight.body),
                overflow: TextOverflow.ellipsis,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
