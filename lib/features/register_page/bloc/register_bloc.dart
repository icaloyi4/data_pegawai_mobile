import 'dart:convert';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ojrek_hris/core/base/base_bloc.dart';
import 'package:ojrek_hris/core/base/bloc_event.dart';
import 'package:ojrek_hris/core/base/bloc_state.dart';

import '../../../core/assets/my_cons.dart';
import '../../../core/routing/page_routing.dart';
import '../../../core/services/setting_service.dart';
import '../../../core/widget/cool_alert.dart';
import '../../login_page/data/remote/login_response.dart' as log;
import '../data/remote/register_model.dart';
import '../data/remote/register_response.dart' as reg;
import '../domain/repository/register_repository.dart';
part 'register_state.dart';
part 'register_event.dart';

class RegisterBloc extends BaseBloc<RegisterEvent, RegisterState> {
  final RegisterRepository _repos;
  bool isOnProcess = false;

  RegisterBloc(this._repos);
  @override
  void mapEventToState(RegisterEvent event) {
    if (event is SignUp) {
      signUp(event);
    }
  }

  void signUp(SignUp event) async {
    emitState(LoadingState());
    await _repos.signUp(
      event.registerModel,
      onSuccess: (reg.RegisterResponse? user) async {
        emitState(SuccessRegister());
        var settingService = await SettingService.getService();
        var dataUser = jsonEncode(user?.data?.toJson());
        await settingService?.set(MyCons.myUser, dataUser);
        String? data = await settingService?.get(MyCons.myUser);

        if (data != null) {
          try {
            // var dataJson = json.decode(data);
            MyCons.dataUser = log.DataUser.fromJson(json.decode(data));
            Get.offAllNamed(PageRouting.REGISTER_SUCCESS);
          } catch (e) {
            print(e);
          }
        } else {
          Get.offAllNamed(PageRouting.WELCOME);
        }
      },
      onError: (message, code) {
        emitState(ErrorRegister());
        AlertMessage.showAlert(event.context,
            title: "Failed",
            message: "[$code] $message",
            type: CoolAlertType.error);
      },
    );
  }
}
