import 'dart:async';

import 'package:ojrek_hris/core/assets/my_color.dart';
import 'package:ojrek_hris/core/assets/my_cons.dart';
import 'package:ojrek_hris/core/assets/my_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ojrek_hris/core/routing/page_routing.dart';
import 'package:ojrek_hris/core/widget/styling.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    MyCons.darkModeEnabled = brightness == Brightness.dark;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: MyCons.darkModeEnabled ? Colors.blueGrey : Colors.white,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: header()),
              Container(
                child: body(),
                height: MediaQuery.of(context).size.height * 0.4,
              ),
              Container(
                child: footer(),
                height: MediaQuery.of(context).size.height * 0.1,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget header() {
    return Container(
        child: Image(
      image: AssetImage(
          MyCons.darkModeEnabled ? MyImages.doc_req_dark : MyImages.doc_req),
    ));
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            "Employee Management System",
            style: styleHeader(
                color: Colors.black, textStyleWeight: TextStyleWeight.Title),
          ),
          Text(
            "Trust us to manage your company's employees. we can help you manage employees in your company easier and faster like lightning.",
            style: styleHeader(
                color: Colors.black45,
                textStyleWeight: TextStyleWeight.subtitle2),
          ),
        ],
      ),
    );
  }

  Widget footer() {
    return Container(
      decoration: styleBoxAllWithColor(colors: Color.fromRGBO(0, 0, 0, 0.032)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: styleBoxAllWithColor(colors: MyColors.mainColor),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(PageRouting.REGISTER);
              },
              child: Text(
                "Register My Company",
                textAlign: TextAlign.center,
                style: styleHeader(
                    color: Colors.white,
                    textStyleWeight: TextStyleWeight.Title3),
              ),
            ),
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.4,
            width: (MediaQuery.of(context).size.width * 0.7) - 20,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(PageRouting.LOGIN);
                },
                child: Text(
                  "Login",
                  style: styleHeader(
                      color: MyColors.mainColor,
                      textStyleWeight: TextStyleWeight.Title3),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.4,
            ),
          )
        ],
      ),
    );
  }
}
