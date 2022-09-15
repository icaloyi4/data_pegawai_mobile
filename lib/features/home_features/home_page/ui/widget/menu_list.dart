import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ojrek_hris/core/assets/my_cons.dart';
import 'package:ojrek_hris/core/routing/page_routing.dart';
import 'package:ojrek_hris/features/home_features/home_page/data/entities/card_list_model.dart';

import '../../../../../core/assets/my_color.dart';
import '../../../../../core/widget/styling.dart';

class MenuList extends StatefulWidget {
  @override
  _MenuList createState() => _MenuList();
}

class _MenuList extends State<MenuList> {
  List<CardMenuModel> _menu = [];

  @override
  void initState() {
    // TODO: implement initState
    if (!MyCons.isWeb)
      _menu.add(new CardMenuModel("Attendance", PageRouting.ATTENDANCE,
          CupertinoIcons.calendar_today, null));
    _menu.add(new CardMenuModel(
        "Document", "", CupertinoIcons.archivebox_fill, null));
    _menu.add(
        new CardMenuModel("Leave", "", CupertinoIcons.briefcase_fill, null));
    _menu.add(
        new CardMenuModel("Overtime", "", CupertinoIcons.clock_fill, null));
    _menu.add(new CardMenuModel("Parking", "", CupertinoIcons.car_fill, null));
    _menu.add(new CardMenuModel(
        "Training", "", CupertinoIcons.book_circle_fill, null));
    _menu.add(new CardMenuModel("To Do", "", CupertinoIcons.list_bullet, null));
    _menu.add(new CardMenuModel(
        "Report", "", CupertinoIcons.chart_bar_square_fill, null));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: MyCons.isWeb ? 6 : 3,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(_menu.length, (index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(_menu[index].routing);
              },
              child: Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        decoration:
                            styleBoxAllWithColor(colors: MyColors.mainColor10),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            _menu[index].icon,
                            size: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          _menu[index].title,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12),
                        ),
                      )
                    ],
                  ),
                )),
              ),
            ),
          );
        }));
  }
}
