import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/kiwi.dart';
import 'package:ojrek_hris/core/assets/my_color.dart';
import 'package:ojrek_hris/core/base/base_stateful.dart';
import 'package:ojrek_hris/core/routing/page_routing.dart';
import 'package:ojrek_hris/core/widget/main_button.dart';
import 'package:ojrek_hris/features/home_features/attendance_page/bloc/attendance_bloc.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

import '../../../../core/assets/my_cons.dart';
import '../../../../core/assets/my_enum.dart';
import '../../../../core/widget/styling.dart';
import 'widget/detail_map.dart';

class CheckInPage extends StatefulWidget {
  @override
  _CheckInPage createState() => _CheckInPage();
}

class _CheckInPage
    extends BaseState<AttendanceBloc, AttendanceState, CheckInPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.5,
        title: Text("Check In",
            style: styleHeader(
                textStyleWeight: TextStyleWeight.Title3,
                color: MyCons.darkModeEnabled ? Colors.white : Colors.black54)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailMap(
                typeMap: TypeMap.MAP_CHECK_IN,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Icon(CupertinoIcons.clock),
                    SizedBox(
                      width: 10,
                    ),
                    DigitalClock(
                      areaWidth: 70,
                      areaDecoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      hourMinuteDigitDecoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      secondDigitDecoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      hourMinuteDigitTextStyle: TextStyle(
                        color: MyCons.darkModeEnabled
                            ? Colors.black38
                            : Colors.blueGrey,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MyCons.width_screen,
                height: MyCons.heigh_screen * 0.3,
                alignment: Alignment.center,
                decoration:
                    styleBoxBorderAll(withBorder: true, borderRadius: 5),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                      child: Icon(
                    CupertinoIcons.camera_circle_fill,
                    size: 100 * MyCons.heigh_percent,
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(PageRouting.USING_CAMERA);
                },
                child: Container(
                  width: MyCons.width_screen,
                  decoration: styleBoxBorderAll(
                      borderColors: MyColors.mainColor,
                      withBorder: true,
                      borderRadius: 5),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(child: Text("Take a picture")),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: TextFormField(
                  decoration:
                      fieldDecoration("Notes", hintText: "Tulis disini ..."),
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  validator: (value) {
                    // _userInputModel.address = value;
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10),
              buttonCheck()
            ],
          ),
        ),
      ),
    );
  }

  @override
  AttendanceBloc initBloc() {
    return KiwiContainer().resolve<AttendanceBloc>();
  }

  @override
  Widget mapStateHandler(AttendanceState? state) {
    // TODO: implement mapStateHandler
    throw UnimplementedError();
  }

  //Widget
  Widget buttonCheck({String message = "Check In"}) {
    return MainButton(
      label: message,
      onTap: () {},
    );
    // return Padding(
    //   padding: const EdgeInsets.all(10.0),
    //   child: GestureDetector(
    //     onTap: () async {
    //       // if (widget.attendanceList.isNotEmpty) {
    //       //   if (widget.attendanceList[0].checkOut == null) {
    //       //     await Get.toNamed(PageRouting.CHECK_IN_ATTENDANCE,
    //       //         arguments: [true, widget.attendanceList[0]]);
    //       //   } else {
    //       //     await Get.toNamed(PageRouting.CHECK_IN_ATTENDANCE,
    //       //         arguments: [false]);
    //       //   }
    //       // } else {
    //       //   await Get.toNamed(PageRouting.CHECK_IN_ATTENDANCE,
    //       //       arguments: [false]);
    //       // }
    //     },
    //     child: Container(
    //       decoration: styleBoxAllWithColor(colors: MyColors.mainColor),
    //       child: Text(
    //         "$message",
    //         style: styleHeader(
    //             color: Colors.white, textStyleWeight: TextStyleWeight.Title3),
    //       ),
    //       alignment: Alignment.center,
    //       height: 50,
    //     ),
    //   ),
    // );
  }
}
