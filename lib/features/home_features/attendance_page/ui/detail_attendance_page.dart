import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ojrek_hris/core/widget/expandable_card.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:timelines/timelines.dart';

import '../../../../core/assets/my_cons.dart';
import '../../../../core/assets/my_enum.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widget/styling.dart';
import '../data/remote/get_attendance_response.dart';
import 'widget/detail_map.dart';

class DetailAttendancePage extends StatefulWidget {
  @override
  _DetailAttendancePage createState() => _DetailAttendancePage();
}

class _DetailAttendancePage extends State<DetailAttendancePage> {
  late AttendanceData _attendanceData;
  LatLng? _positionChekIn;
  LatLng? _positionChekOut;
  PanelController _pc = new PanelController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _attendanceData = Get.arguments;
    if (_attendanceData.locationCheckIn != null) {
      var _checkIn = _attendanceData.locationCheckIn.toString().split(",");
      _positionChekIn = LatLng(double.parse(_checkIn[0].toString()),
          double.parse(_checkIn[1].toString()));
    }

    if (_attendanceData.locationCheckOut != null) {
      var _checkOut = _attendanceData.locationCheckOut.toString().split(",");
      _positionChekOut = LatLng(double.parse(_checkOut[0].toString()),
          double.parse(_checkOut[1].toString()));
    }
    // _pc.open();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.5,
        title: Text(
            "${changeDateFormat(date: _attendanceData.createdAt.toString(), newFormat: MyCons.DATE_FORMAT_BEAUTY)}",
            style: styleHeader(
                textStyleWeight: TextStyleWeight.Title3,
                color: MyCons.darkModeEnabled ? Colors.white : Colors.black54)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              // TimelineTile(
              //   nodeAlign: TimelineNodeAlign.start,
              //   oppositeContents: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Text('opposite\ncontents'),
              //   ),
              //   contents: Card(
              //     child: Container(
              //       width: MediaQuery.of(context).size.width,
              //       padding: EdgeInsets.all(8.0),
              //       child: Column(
              //         children: [
              //           Text("${MyCons.dataUser?.user?.name}"),
              //           Text("${MyCons.dataUser?.department?.name}")
              //         ],
              //       ),
              //     ),
              //   ),
              //   node: TimelineNode(),
              // ),
              TimelineTile(
                nodeAlign: TimelineNodeAlign.start,
                oppositeContents: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('opposite\ncontents'),
                ),
                contents: ExpandableCard(
                    headerChild: Column(
                      children: [
                        Container(
                            width: MyCons.width_screen * MyCons.width_percent,
                            child: _attendanceData.locationCheckIn != null
                                ? DetailMap(
                                    startLocation: _positionChekIn!,
                                    attendanceData: _attendanceData,
                                    typeMap: TypeMap.MAP_OPEN,
                                  )
                                : Center(child: Text("No Location Found"))),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: textWithIcon(
                              icon: CupertinoIcons.clock,
                              text: changeDateFormat(
                                  date: _attendanceData.checkIn.toString(),
                                  newFormat: MyCons.HOURMIN_FORMAT_SERVER)),
                        ),
                      ],
                    ),
                    expandedChild: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Photos"),
                        SizedBox(
                          height: 10,
                        ),
                        Image.network(
                          _attendanceData.imagePathCheckIn.toString(),
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fitWidth,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Notes"),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            "${_attendanceData.notesCheckIn != null ? _attendanceData.notesCheckIn : "-"}"),
                      ],
                    )),
                node: TimelineNode(
                  indicator: Icon(CupertinoIcons.clock_fill),
                  endConnector: (_attendanceData.checkOut != null)
                      ? DashedLineConnector()
                      : null,
                ),
              ),
              (_attendanceData.locationCheckOut != null)
                  ? TimelineTile(
                      nodeAlign: TimelineNodeAlign.start,
                      oppositeContents: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('opposite\ncontents'),
                      ),
                      contents: ExpandableCard(
                          headerChild: Column(
                            children: [
                              Container(
                                  width: MyCons.width_screen *
                                      MyCons.heigh_percent,
                                  child: _attendanceData.locationCheckOut !=
                                          null
                                      ? DetailMap(
                                          startLocation: _positionChekOut!,
                                          attendanceData: _attendanceData,
                                          typeMap: TypeMap.MAP_OPEN,
                                        )
                                      : Center(
                                          child: Text("No Location Found"))),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: textWithIcon(
                                    icon: CupertinoIcons.clock,
                                    text: changeDateFormat(
                                        date:
                                            _attendanceData.checkOut.toString(),
                                        newFormat:
                                            MyCons.HOURMIN_FORMAT_SERVER)),
                              ),
                            ],
                          ),
                          expandedChild: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Photos"),
                              SizedBox(
                                height: 10,
                              ),
                              Image.network(
                                _attendanceData.imagePathCheckOut!,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.fitWidth,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Notes"),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  "${_attendanceData.notesCheckOut != null ? _attendanceData.notesCheckOut : "-"}"),
                            ],
                          )),
                      node: TimelineNode(
                        indicator: Icon(CupertinoIcons.clock_fill),
                        startConnector: DashedLineConnector(),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
    // Container(
    //   child: SingleChildScrollView(
    //     child: Column(
    //       children: [
    //         (_positionChekIn != null)
    //             ? DetailMap(startLocation: _positionChekIn!)
    //             : Container()
    //       ],
    //     ),
    //   ),
    // )
    // (_positionChekIn != null)
    //     ? Container(
    //         width: MyCons.width_screen * MyCons.heigh_percent,
    //         height: MyCons.heigh_screen * 0.3 * MyCons.width_percent,
    //         child: DetailMap(startLocation: _positionChekIn!))
    //     : Container());
  }
}
