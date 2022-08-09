import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ojrek_hris/core/base/base_bloc.dart';
import 'package:ojrek_hris/core/base/bloc_event.dart';
import 'package:ojrek_hris/core/base/bloc_state.dart';
import 'package:ojrek_hris/features/admin_features/crud_department_page/data/remote/get_department_position_response.dart';

import '../../../../core/routing/page_routing.dart';
import '../../../../core/widget/cool_alert.dart';
import '../domain/repository/crud_department_repository.dart';
part 'crud_department_state.dart';
part 'crud_department_event.dart';

class CrudDepartmentBloc
    extends BaseBloc<CrudDepartmentEvent, CrudDepartmentState> {
  final CrudDepartmentRepository _repos;
  bool isOnProcess = false;

  CrudDepartmentBloc(this._repos);
  @override
  void mapEventToState(CrudDepartmentEvent event) {
    if (event is GetDepartmenPosition) {
      getDepartmentPosition(event);
    }

    if (event is RegisterDepartment) {
      registerDepartment(event);
    }

    if (event is DeleteDepartment) {
      deleteDepartment(event);
    }
  }

  void getDepartmentPosition(event) async {
    emitState(LoadingState());
    await _repos.getDepartmenPosition(
      onSuccess: (List<DataDepartment> dept) {
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

  void registerDepartment(RegisterDepartment event) async {
    emitState(LoadingState());
    for (var i = 0; i < event.DepartmentInputModel.position.length; i++) {
      event.DepartmentInputModel.position[i].level = (i + 1);
    }
    await _repos.registerDepartment(
      event.DepartmentInputModel,
      event.isUpdate,
      onSuccess: () {
        emitState(SuccesRegisterDepartment());
        // Get.back(closeOverlays: true);
        AlertMessage.showAlert(
          event.context,
          title: "Success",
          message: "Employee already registered",
          type: CoolAlertType.success,
          confirmTxt: "Continue",
          onConfirm: () {
            // Navigator.of(event.context).pop();
            print(Get.currentRoute);
            if (Get.currentRoute == PageRouting.ADD_DEPARTMENT)
              Get.back(closeOverlays: true);
            print(Get.currentRoute);
            if (Get.currentRoute == PageRouting.ADD_DEPARTMENT)
              Get.back(closeOverlays: true);
          },
        );
      },
      onError: (message, code) {
        emitState(ErrorRegisterDepartment());
        AlertMessage.showAlert(event.context,
            title: "Register Failed",
            message: "[$code] $message",
            type: CoolAlertType.error);
      },
    );
  }

  void deleteDepartment(DeleteDepartment event) async {
    emitState(LoadingState());
    await _repos.deleteUser(
      event.idDepartment,
      onSuccess: () {
        getDepartmentPosition(event);
      },
      onError: (message, code) {
        // emitState(ErrorDeleteUser());
        getDepartmentPosition(event);
        AlertMessage.showAlert(event.context,
            title: "Delete Failed",
            message: "[$code] $message",
            type: CoolAlertType.error);
      },
    );
  }
}
