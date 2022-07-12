import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ojrek_hris/core/assets/my_color.dart';
import 'package:ojrek_hris/core/widget/styling.dart';
import 'package:ojrek_hris/features/admin_home_page/data/entities/card_list_model.dart';

import '../../../core/assets/my_cons.dart';

class AdminHomePage extends StatefulWidget {
  @override
  _AdminHomePage createState() => _AdminHomePage();
}

class _AdminHomePage extends State<AdminHomePage> {
  List<CardMenuModel> _menu = [];

  @override
  void initState() {
    // TODO: implement initState
    _menu.add(
        new CardMenuModel("User Management", "", CupertinoIcons.person, null));
    _menu.add(new CardMenuModel(
        "Company Management", "", CupertinoIcons.building_2_fill, null));
    _menu.add(
        new CardMenuModel("Company Management", "", CupertinoIcons.bag, null));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(_menu.length, (index) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                  decoration: styleBoxAllWithColor(
                      border: Border.all(width: 1, color: MyColors.mainColor)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Expanded(
                            child: Icon(
                          _menu[index].icon,
                          size: 100,
                        )),
                        Text(
                          _menu[index].title,
                          textAlign: TextAlign.center,
                          style: styleHeader(
                              color: MyColors.mainColor,
                              textStyleWeight: TextStyleWeight.Title3),
                        )
                      ],
                    ),
                  )),
            ),
          );
        }));
  }
}
