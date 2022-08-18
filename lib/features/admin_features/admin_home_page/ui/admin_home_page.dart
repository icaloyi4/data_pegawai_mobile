import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ojrek_hris/core/assets/my_color.dart';
import 'package:ojrek_hris/core/routing/page_routing.dart';
import 'package:ojrek_hris/core/widget/styling.dart';
import 'package:ojrek_hris/features/admin_features/admin_home_page/data/entities/card_list_model.dart';

import '../../../../core/assets/my_cons.dart';
import '../../../../core/widget/cool_alert.dart';

class AdminHomePage extends StatefulWidget {
  @override
  _AdminHomePage createState() => _AdminHomePage();
}

class _AdminHomePage extends State<AdminHomePage> {
  List<CardMenuModel> _menu = [];

  @override
  void initState() {
    // TODO: implement initState
    _menu.add(new CardMenuModel(
        "Announcement", "", CupertinoIcons.bell_circle_fill, null));

    _menu.add(new CardMenuModel("Company", PageRouting.EDIT_COMPANY,
        CupertinoIcons.building_2_fill, null));
    _menu.add(new CardMenuModel("Department", PageRouting.CRUD_DEPARTMENT,
        CupertinoIcons.briefcase_fill, null));
    _menu.add(new CardMenuModel(
        "Employee", PageRouting.CRUD_USER, CupertinoIcons.person_3_fill, null));
    _menu.add(new CardMenuModel(
        "FAQ", "", CupertinoIcons.question_circle_fill, null));
    _menu.add(new CardMenuModel(
        "News", PageRouting.CRUD_NEWS, CupertinoIcons.news, null));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.5,
        title: Text("${MyCons.dataUser?.company?.name}",
            style: styleHeader(
                textStyleWeight: TextStyleWeight.Title3,
                color: MyCons.darkModeEnabled ? Colors.white : Colors.black54)),
      ),
      body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(_menu.length, (index) {
            return GestureDetector(
              onTap: () {
                if (_menu[index].routing.isNotEmpty) {
                  Get.toNamed(_menu[index].routing);
                } else {
                  AlertMessage.showAlert(context,
                      message: "Feature not ready",
                      type: CoolAlertType.info,
                      title: "Information");
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
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
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            decoration: styleBoxAllWithColor(
                                colors: MyColors.mainColor10),
                            height: 100,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                _menu[index].icon,
                                size: 75,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Container(
                          height: 20,
                          alignment: Alignment.center,
                          child: Text(
                            _menu[index].title,
                            textAlign: TextAlign.center,
                            style: styleHeader(
                                textStyleWeight: TextStyleWeight.body),
                          ),
                        )
                      ],
                    ),
                  )),
                ),
              ),
            );
          })),
    );
  }
}
