import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:ojrek_hris/core/base/base_bloc.dart';
import 'package:ojrek_hris/core/base/bloc_event.dart';
import 'package:ojrek_hris/core/base/bloc_state.dart';
import 'package:ojrek_hris/features/home_features/attendance_page/data/remote/get_attendance_response.dart';

import '../../../../core/widget/cool_alert.dart';
import '../domain/repository/attendance_repository.dart';

part 'attendance_state.dart';
part 'attendance_event.dart';

class AttendanceBloc extends BaseBloc<AttendanceEvent, AttendanceState> {
  final AttendanceRepository _repos;
  bool isOnProcess = false;

  AttendanceBloc(this._repos);
  @override
  void mapEventToState(AttendanceEvent event) {
    // if (event is Logout) {
    //   logout(event: event, repos: _repos);
    // }
    if (event is GetAttendance) {
      getAttendance(event);
    }
  }

  void getAttendance(GetAttendance event) async {
    emitState(LoadingState());
    await _repos.getAttendance(
        onSuccess: (attendanceList) {
          emitState(SuccessGetAttendance(attendanceList));
        },
        onError: (code, message) {
          emitState(ErrorGetAttendance());
        AlertMessage.showAlert(event.context,
            title: "Failed",
            message: "[$code] $message",
            type: CoolAlertType.error);
        });
  }

  // static void logout({Logout? event, AttendanceRepository? repos}) async {
  //   // emitState(LoadingState());
  //   if (event != null) {
  //     AlertMessage.showAlert(event.context,
  //         message: "Loading ....", type: CoolAlertType.loading);
  //     await repos?.logout(
  //       onSuccess: () async {
  //         var settingService = await SettingService.getService();
  //         String? data = await settingService?.get(MyCons.myUser);
  //         if (data != null) {
  //           settingService?.del(MyCons.myUser);
  //         }
  //         Get.offAllNamed(PageRouting.WELCOME);
  //       },
  //       onError: (message, code) async {
  //         AlertMessage.showAlert(
  //           event.context,
  //           title: "Failed",
  //           message: "[$code] $message",
  //           type: CoolAlertType.error,
  //           onConfirm: () async {
  //             var settingService = await SettingService.getService();
  //             String? data = await settingService?.get(MyCons.myUser);
  //             if (data != null) {
  //               settingService?.del(MyCons.myUser);
  //             }
  //             Get.offAllNamed(PageRouting.WELCOME);
  //           },
  //         );
  //         if (code == 401) {
  //           var settingService = await SettingService.getService();
  //           String? data = await settingService?.get(MyCons.myUser);
  //           if (data != null) {
  //             settingService?.del(MyCons.myUser);
  //           }
  //           Get.offAllNamed(PageRouting.WELCOME);
  //         }
  //       },
  //     );
  //   } else {
  //     var settingService = await SettingService.getService();
  //     String? data = await settingService?.get(MyCons.myUser);
  //     if (data != null) {
  //       settingService?.del(MyCons.myUser);
  //     }
  //     Get.offAllNamed(PageRouting.WELCOME);
  //   }
  // }
}
