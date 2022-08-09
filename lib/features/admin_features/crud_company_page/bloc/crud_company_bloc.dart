import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ojrek_hris/core/base/base_bloc.dart';
import 'package:ojrek_hris/core/base/bloc_event.dart';
import 'package:ojrek_hris/core/base/bloc_state.dart';
import 'package:flutter/foundation.dart';
import 'package:ojrek_hris/features/login_page/data/remote/login_response.dart';

import '../../../../core/assets/my_cons.dart';
import '../../../../core/routing/page_routing.dart';
import '../../../../core/widget/cool_alert.dart';
import '../domain/repository/crud_company_repository.dart';

part 'crud_company_state.dart';
part 'crud_company_event.dart';

class CrudCompanyBloc extends BaseBloc<CrudCompanyEvent, CrudCompanyState> {
  final CrudCompanyRepository _repos;
  bool isOnProcess = false;

  CrudCompanyBloc(this._repos);
  @override
  void mapEventToState(CrudCompanyEvent event) {
    if (event is UpdateCompany) {
      updateCompany(event);
    }
  }

  void updateCompany(UpdateCompany event) async {
    emitState(LoadingState());
    await _repos.updateCompany(
      event.company,
      onSuccess: () {
        emitState(SuccesUpdateCompany());
        // Get.back(closeOverlays: true);
        MyCons.dataUser?.company = event.company;
        AlertMessage.showAlert(
          event.context,
          title: "Success",
          message: "Company already updated",
          type: CoolAlertType.success,
          confirmTxt: "Continue",
          onConfirm: () {
            // Navigator.of(event.context).pop();

            if (Get.currentRoute == PageRouting.EDIT_COMPANY)
              Get.back(closeOverlays: true);
            if (Get.currentRoute == PageRouting.EDIT_COMPANY)
              Get.back(closeOverlays: true);
          },
        );
      },
      onError: (message, code) {
        emitState(ErrorUpdateCompany());
        AlertMessage.showAlert(event.context,
            title: "Update Failed",
            message: "[$code] $message",
            type: CoolAlertType.error);
      },
    );
  }
}
