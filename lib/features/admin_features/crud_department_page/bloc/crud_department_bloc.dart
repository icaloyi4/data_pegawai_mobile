import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:ojrek_hris/core/base/base_bloc.dart';
import 'package:ojrek_hris/core/base/bloc_event.dart';
import 'package:ojrek_hris/core/base/bloc_state.dart';
import 'package:ojrek_hris/features/admin_features/crud_department_page/data/remote/get_department_position_response.dart';

import '../../../../core/widget/cool_alert.dart';
import '../domain/repository/crud_department_repository.dart';
part 'crud_department_state.dart';
part 'crud_department_event.dart';

class CrudDepartmentBloc extends BaseBloc<CrudDepartmentEvent, CrudDepartmentState> {
  final CrudDepartmentRepository _repos;
  bool isOnProcess = false;

  CrudDepartmentBloc(this._repos);
  @override
  void mapEventToState(CrudDepartmentEvent event) {
    if (event is GetDepartmenPosition) {
      getDepartmentPosition(event);
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
}
