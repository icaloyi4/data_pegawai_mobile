import 'dart:developer';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ojrek_hris/core/base/base_bloc.dart';
import 'package:ojrek_hris/core/base/bloc_event.dart';
import 'package:ojrek_hris/core/base/bloc_state.dart';
import 'package:flutter/foundation.dart';
import 'package:ojrek_hris/core/widget/cool_alert.dart';

import '../../../core/assets/my_cons.dart';
import '../../../core/routing/page_routing.dart';
import '../../../core/services/setting_service.dart';
import '../domain/repository/user_repository.dart';
part 'user_state.dart';
part 'user_event.dart';

class UserBloc extends BaseBloc<UserEvent, UserState> {
  final UserRepository _repos;
  bool isOnProcess = false;

  UserBloc(this._repos);
  @override
  void mapEventToState(UserEvent event) {
    if (event is Logout) {
      logout(event: event, repos: _repos);
    }
  }

  static void logout({Logout? event, UserRepository? repos}) async {
    // emitState(LoadingState());
    if (event != null) {
      AlertMessage.showAlert(event.context,
          message: "Loading ....", type: CoolAlertType.loading);
      await repos?.logout(
        onSuccess: () async {
          var settingService = await SettingService.getService();
          String? data = await settingService?.get(MyCons.myUser);
          if (data != null) {
            settingService?.del(MyCons.myUser);
          }
          Get.offAllNamed(PageRouting.WELCOME);
        },
        onError: (message, code) async {
          AlertMessage.showAlert(event.context,
              title: "Login Failed",
              message: "[$code] $message",
              type: CoolAlertType.error);
          if (code == 401) {
            var settingService = await SettingService.getService();
            String? data = await settingService?.get(MyCons.myUser);
            if (data != null) {
              settingService?.del(MyCons.myUser);
            }
            Get.offAllNamed(PageRouting.WELCOME);
          }
        },
      );
    } else {
      var settingService = await SettingService.getService();
      String? data = await settingService?.get(MyCons.myUser);
      if (data != null) {
        settingService?.del(MyCons.myUser);
      }
      Get.offAllNamed(PageRouting.WELCOME);
    }
  }
}
