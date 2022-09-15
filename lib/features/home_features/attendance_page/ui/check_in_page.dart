import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/kiwi.dart';
import 'package:ojrek_hris/core/assets/my_color.dart';
import 'package:ojrek_hris/core/base/base_stateful.dart';
import 'package:ojrek_hris/core/routing/page_routing.dart';
import 'package:ojrek_hris/core/widget/cool_alert.dart';
import 'package:ojrek_hris/core/widget/main_button.dart';
import 'package:ojrek_hris/features/home_features/attendance_page/bloc/attendance_bloc.dart';
import 'package:ojrek_hris/features/home_features/attendance_page/data/remote/check_in_out.dart';
import 'package:ojrek_hris/features/home_features/attendance_page/data/remote/get_attendance_response.dart';
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
  XFile? _image;
  late CheckInOutModel _checkInOutModel;
  AttendanceData? _attendanceData;
  bool _isCheckIn = false;
  TextEditingController _controllerNotes = new TextEditingController();
  // TextEditingController _controllerNotes = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isCheckIn = Get.arguments[0];
    _attendanceData = Get.arguments[1];
    if (_isCheckIn) {
      _checkInOutModel = new CheckInOutModel(isCheckIn: _isCheckIn);
    } else {
      _checkInOutModel =
          new CheckInOutModel(isCheckIn: _isCheckIn, id: _attendanceData?.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.5,
        title: Text(_isCheckIn ? "Check In" : "Check Out",
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
                checkInOutModel: _checkInOutModel,
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
                  child: (_image != null)
                      ? Stack(
                          children: [
                            Image.file(
                              File(_image!.path),
                            ),
                            Positioned(
                                right: 10,
                                top: 10,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _image = null;
                                      _checkInOutModel.image = null;
                                    });
                                  },
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.grey,
                                  ),
                                )),
                          ],
                        )
                      : Center(
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
                onTap: () async {
                  //  _image = await Get.toNamed(PageRouting.USING_CAMERA);
                  var imagenya = await Get.toNamed(PageRouting.USING_CAMERA);
                  if (imagenya != null) {
                    _image = imagenya;
                    _checkInOutModel.image = File(imagenya.path);
                  }

                  setState(() {});
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
                  controller: _controllerNotes,
                  decoration:
                      fieldDecoration("Notes", hintText: "Tulis disini ..."),
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  validator: (value) {
                    // _userInputModel.address = value;
                    _checkInOutModel.notes = value;
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10),
              StreamBuilder<AttendanceState>(
                  stream: bloc.stateStream,
                  initialData: InitState(),
                  builder: (blocCtx, snapshot) =>
                      mapStateHandler(snapshot.data)),
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
    if (state is LoadingState) {
      return Center(child: CircularProgressIndicator());
    }
    return buttonCheck();
  }

  //Widget
  Widget buttonCheck({String message = "Check In"}) {
    return MainButton(
      label: message,
      onTap: () {
        if (_checkInOutModel.image != null) {
          _checkInOutModel.time = DateTime.now();
          _checkInOutModel.notes = _controllerNotes.text;
          bloc.pushEvent(CheckInOut(context, _checkInOutModel));
        } else {
          AlertMessage.showAlert(context,
              title: "Required",
              message: "Image cannot be blank",
              type: CoolAlertType.error);
        }
      },
    );
  }
}
