import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ojrek_hris/core/base/base_bloc.dart';
import 'package:ojrek_hris/core/base/bloc_event.dart';
import 'package:ojrek_hris/core/base/bloc_state.dart';
import 'package:ojrek_hris/core/routing/page_routing.dart';
import 'package:ojrek_hris/features/admin_features/crud_user_page/data/remote/get_department_position_response.dart'
    as dept;
import 'package:ojrek_hris/features/admin_features/crud_user_page/data/remote/get_user_response.dart'
    as usr;
import 'package:ojrek_hris/features/admin_features/crud_user_page/data/remote/get_user_response.dart';

import '../../../../core/widget/cool_alert.dart';
import '../domain/repository/crud_user_repository.dart';
part 'crud_user_state.dart';
part 'crud_user_event.dart';

class CrudUserBloc extends BaseBloc<CrudUserEvent, CrudUserState> {
  final CrudUserRepository _repos;
  bool isOnProcess = false;

  CrudUserBloc(this._repos);
  @override
  void mapEventToState(CrudUserEvent event) {
    if (event is GetDataCrudUser) {
      getDataUser(event);
    }

    if (event is GetDepartmenPosition) {
      getDepartmentPosition(event);
    }

    if (event is RegisterUser) {
      registerUser(event);
    }
    if (event is DeleteUser) {
      deleteUser(event);
    }

    if (event is FilterUser) {
      filterUser(event);
    }
  }

  void getDataUser(event) async {
    emitState(LoadingState());
    await _repos.getDataUser(
      onSuccess: (List<usr.DataUserRegister> user) {
        emitState(SuccesGetUser(user));
      },
      onError: (message, code) {
        emitState(ErrorGetUser());
        AlertMessage.showAlert(event.context,
            title: "Failed",
            message: "[$code] $message",
            type: CoolAlertType.error);
      },
    );
  }

  void getDepartmentPosition(event) async {
    emitState(LoadingState());
    await _repos.getDepartmenPosition(
      onSuccess: (List<dept.DataDepartment> dept) {
        emitState(SuccesGetDeptPos(dept));
      },
      onError: (message, code) {
        emitState(ErrorDeptPos());
        AlertMessage.showAlert(event.context,
            title: "Failed",
            message: "[$code] $message",
            type: CoolAlertType.error);
      },
    );
  }

  void registerUser(event) async {
    emitState(LoadingState());
    await _repos.registerUser(
      event.userInputModel,
      event.isUpdate,
      onSuccess: () {
        emitState(SuccesRegisterUser());
        // Get.back(closeOverlays: true);
        AlertMessage.showAlert(
          event.context,
          title: "Success",
          message: "Employee already registered",
          type: CoolAlertType.success,
          confirmTxt: "Continue",
          onConfirm: () {
            // Navigator.of(event.context).pop();
            if (Get.currentRoute == PageRouting.ADD_USER)
              Get.back(closeOverlays: true);
            if (Get.currentRoute == PageRouting.ADD_USER)
              Get.back(closeOverlays: true);
          },
        );
      },
      onError: (message, code) {
        emitState(ErrorRegisterUser());
        AlertMessage.showAlert(event.context,
            title: "Register Failed",
            message: "[$code] $message",
            type: CoolAlertType.error);
      },
    );
  }

  void deleteUser(DeleteUser event) async {
    emitState(LoadingState());
    await _repos.deleteUser(
      event.idUser,
      onSuccess: () {
        getDataUser(event);
      },
      onError: (message, code) {
        // emitState(ErrorDeleteUser());
        getDataUser(event);
        AlertMessage.showAlert(event.context,
            title: "Delete Failed",
            message: "[$code] $message",
            type: CoolAlertType.error);
      },
    );
  }

  void filterUser(FilterUser event) {
    var userFiltered = event.dataUser.where((element) {
      return element.name
          .toString()
          .toLowerCase()
          .contains(event.filter.toString().toLowerCase());
    }).toList();
    emitState(SuccesGetUserFilter(userFiltered));
  }
}
