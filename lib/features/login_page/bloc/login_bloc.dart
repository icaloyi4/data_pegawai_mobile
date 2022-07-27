import 'dart:convert';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ojrek_hris/core/base/base_bloc.dart';
import 'package:ojrek_hris/core/base/bloc_event.dart';
import 'package:ojrek_hris/core/base/bloc_state.dart';
import 'package:flutter/foundation.dart';
import 'package:ojrek_hris/core/utils/shared_preff.dart';
import 'package:ojrek_hris/core/widget/cool_alert.dart';
import 'package:ojrek_hris/features/login_page/data/remote/login_response.dart';

import '../../../core/assets/my_cons.dart';
import '../../../core/routing/page_routing.dart';
import '../../../core/services/setting_service.dart';
import '../domain/repository/login_repository.dart';
part 'login_state.dart';
part 'login_event.dart';

class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  final LoginRepository _repos;
  bool isOnProcess = false;

  LoginBloc(this._repos);
  @override
  void mapEventToState(LoginEvent event) {
    if (event is LoginProcess) {
      login(event);
    }
  }

  void login(LoginProcess event) async {
    emitState(LoadingState());
    await _repos.login(
      event.email,
      event.password,
      onSuccess: (user) async {
        emitState(SuccessLogin(user?.data));
        var settingService = await SettingService.getService();
        var dataUser = jsonEncode(user?.data?.toJson());
        await settingService?.set(MyCons.myUser, dataUser);
        MyCons.dataUser = user?.data;
        Get.offAllNamed(PageRouting.HOME);
      },
      onError: (message, code) {
        emitState(ErrorLogin());
        AlertMessage.showAlert(event.context,
            title: "Login Failed",
            message: "[$code] $message",
            type: CoolAlertType.error);
      },
    );
  }
}
