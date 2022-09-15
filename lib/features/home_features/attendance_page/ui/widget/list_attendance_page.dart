import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:ojrek_hris/core/assets/my_color.dart';
import 'package:ojrek_hris/core/assets/my_cons.dart';
import 'package:ojrek_hris/core/assets/my_enum.dart';
import 'package:ojrek_hris/core/utils/utils.dart';
import 'package:ojrek_hris/core/widget/main_button.dart';
import 'package:ojrek_hris/features/home_features/attendance_page/bloc/attendance_bloc.dart';

import '../../../../../core/routing/page_routing.dart';
import '../../../../../core/widget/styling.dart';
import '../../data/remote/get_attendance_response.dart';

class ListAttendance extends StatefulWidget {
  final List<AttendanceData> attendanceList;
  final AttendanceBloc bloc;
  final BuildContext parentPageCtx;

  const ListAttendance({required this.attendanceList, required this.bloc, required this.parentPageCtx});
  @override
  _ListAttendance createState() => _ListAttendance();
}

class _ListAttendance extends State<ListAttendance> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
              child: listAttendance(widget.attendanceList)),
        ),
        chekButtonType()
      ],
    );
  }

  Widget listAttendance(List<AttendanceData> _dataAttendance) {
    // _dataUserFiltered = dataUser;
    // _dataUser.addAll(dataUser);
    return GroupedListView<dynamic, String>(
      elements: _dataAttendance,
      shrinkWrap: true,
      groupBy: (element) {
        return changeDateFormat(
            date: element.checkIn.toString(),
            newFormat: MyCons.MONTHYEAR_FORMAT_SERVER);
      },
      groupSeparatorBuilder: (String groupByValue) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "${groupByValue != "null" ? changeDateFormat(date: groupByValue, format: MyCons.MONTHYEAR_FORMAT_SERVER, newFormat: MyCons.MONTHYEAR_FORMAT_BEAUTY) : "-"}",
            style: styleHeader(textStyleWeight: TextStyleWeight.subtitle2),
          ),
        );
      },
      itemBuilder: (ctx, element) {
        return itemAttendance(ctx, element);
      },
      itemComparator: (item1, item2) {
        var dateItem1 = changeDateFormat(
            date: item1.checkIn.toString(),
            newFormat: MyCons.MONTHYEAR_FORMAT_SERVER);
        print("item 1 : ${dateItem1.toString()}");
        var dateTimeItem1 = parseStringtoDate(
            date: dateItem1, format: MyCons.MONTHYEAR_FORMAT_SERVER);
        var dateTimeItem1ToMili = dateTimeItem1.millisecondsSinceEpoch;
        var dateItem2 = changeDateFormat(
            date: item2.checkIn.toString(),
            newFormat: MyCons.MONTHYEAR_FORMAT_SERVER);
        var dateTimeItem2 = parseStringtoDate(
            date: dateItem2, format: MyCons.MONTHYEAR_FORMAT_SERVER);
        var dateTimeItem2ToMili = dateTimeItem2.millisecondsSinceEpoch;

        // if (item1.department == null) {
        //   item1 = "-";
        // } else {
        //   item1 = item1.department;
        // }

        // if (item2.department == null) {
        //   item2 = "-";
        // } else {
        //   item2 = item2.department;
        // }
        // print(item1.department.compareTo(item1.department));
        return dateTimeItem1ToMili.compareTo(dateTimeItem2ToMili);
      }, // optional
      // useStickyGroupSeparators: true, // optional // optional
      order: GroupedListOrder.ASC, // optional
    );
  }

  Widget chekButtonType() {
    if (widget.attendanceList.isNotEmpty) {
      var newestCheckIn = changeDateFormat(
          date: widget.attendanceList[0].checkIn.toString(),
          newFormat: MyCons.DATE_FORMAT_SERVER);
      var dateNow =
          chageDateToString(DateTime.now(), format: MyCons.DATE_FORMAT_SERVER);
      if (newestCheckIn == dateNow) {
        if (widget.attendanceList[0].checkOut == null) {
          return buttonCheck(message: "Check Out");
        }
        return Container();
      } else {
        return buttonCheck();
      }
    } else {
      return buttonCheck();
    }
  }

  Widget buttonCheck({String message = "Check In"}) {
    return MainButton(
      label: message,
      onTap: () async {
        if (widget.attendanceList.isNotEmpty) {
          if (widget.attendanceList[0].checkOut == null) {
            await Get.toNamed(PageRouting.CHECK_IN_ATTENDANCE,
                arguments: [false, widget.attendanceList[0]]);
          } else {
            await Get.toNamed(PageRouting.CHECK_IN_ATTENDANCE,
                arguments: [true, null]);
          }
        } else {
          await Get.toNamed(PageRouting.CHECK_IN_ATTENDANCE, arguments: [true,null]);
        }
        widget.bloc.pushEvent(GetAttendance(context));
      },
    );
    // return Padding(
    //   padding: const EdgeInsets.all(10.0),
    //   child: GestureDetector(
    //     onTap: () async {
    //       if (widget.attendanceList.isNotEmpty) {
    //         if (widget.attendanceList[0].checkOut == null) {
    //           await Get.toNamed(PageRouting.CHECK_IN_ATTENDANCE,
    //               arguments: [true, widget.attendanceList[0]]);
    //         } else {
    //           await Get.toNamed(PageRouting.CHECK_IN_ATTENDANCE,
    //               arguments: [false]);
    //         }
    //       } else {
    //         await Get.toNamed(PageRouting.CHECK_IN_ATTENDANCE,
    //             arguments: [false]);
    //       }
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

  Widget itemAttendance(BuildContext ctx, AttendanceData element) {
    return GestureDetector(
      onTap: () {
        // if (_menu[index].routing.isNotEmpty) {
        //   Get.toNamed(_menu[index].routing);
        // } else {
        //   AlertMessage.showAlert(context,
        //       message: "Feature not ready",
        //       type: CoolAlertType.info,
        //       title: "Information");
        // }
        Get.toNamed(PageRouting.DETAIL_ATTENDANCE, arguments: element);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: (element.checkOut == null)
              ? Colors.blueGrey[200]
              : Colors.grey[100],
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    height: 100,
                    width: 100,
                    child: Text(
                      "${parseStringtoDate(date: element.checkIn.toString()).day} \n ${DateFormat.EEEE().format(parseStringtoDate(date: element.checkIn.toString())).toString().substring(0, 3)}",
                      textAlign: TextAlign.center,
                      style: styleHeader(
                          color: MyCons.darkModeEnabled
                              ? Colors.blueGrey
                              : MyColors.mainColor,
                          textStyleWeight: TextStyleWeight.Title3),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MyCons.width_screen * 0.4,
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${element.checkIn == null ? "--:--" : DateFormat.Hm().format(parseStringtoDate(date: element.checkIn.toString()))}",
                                  style: styleHeader(
                                      textStyleWeight:
                                          TextStyleWeight.subtitle3),
                                ),
                              ),
                              Text(
                                "Check In",
                                style: styleHeader(
                                    textStyleWeight: TextStyleWeight.subtitle2),
                              ),
                            ],
                          ),
                          Expanded(
                              child: Container(
                            child: Text(
                              "|",
                              style: styleHeader(
                                  textStyleWeight: TextStyleWeight.subtitle1),
                              textAlign: TextAlign.center,
                            ),
                          )),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${element.checkOut == null ? "--:--" : DateFormat.Hm().format(parseStringtoDate(date: element.checkOut.toString()))}",
                                  style: styleHeader(
                                      textStyleWeight:
                                          TextStyleWeight.subtitle3),
                                ),
                              ),
                              Text(
                                "Check Out",
                                style: styleHeader(
                                    textStyleWeight: TextStyleWeight.subtitle2),
                              ),
                            ],
                          ),
                          // Expanded(child: Container()),
                          // Column(
                          //   children: [
                          //     Text(
                          //       "Check Out",
                          //       style: styleHeader(
                          //           textStyleWeight: TextStyleWeight.Title2),
                          //     ),
                          //     Text(
                          //       "-",
                          //       style: styleHeader(),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
