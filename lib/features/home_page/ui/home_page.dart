import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ojrek_hris/core/widget/styling.dart';
import 'package:ojrek_hris/features/home_page/ui/widget/announcement.dart';
import 'package:ojrek_hris/features/home_page/ui/widget/header.dart';
import 'package:ojrek_hris/features/home_page/ui/widget/menu_list.dart';
import 'package:ojrek_hris/features/home_page/ui/widget/news.dart';
import 'package:ojrek_hris/features/home_page/ui/widget/weather.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

import '../../../core/routing/page_routing.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Header(),
                SizedBox(
                  height: 20,
                ),
                //Weather
                WeatherCard(),
                SizedBox(
                  height: 15,
                ),
                MenuList(),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Announcement",
                  style:
                      styleHeader(textStyleWeight: TextStyleWeight.subtitle2),
                ),
                Announcement(),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "News",
                        style: styleHeader(
                            textStyleWeight: TextStyleWeight.subtitle2),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(PageRouting.NEWS_ALL);
                      },
                      child: Text(
                        "See All",
                        style: styleHeader(
                            textStyleWeight: TextStyleWeight.subtitle3),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                News()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
