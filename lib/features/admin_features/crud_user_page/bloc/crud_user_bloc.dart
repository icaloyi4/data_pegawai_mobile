import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:ojrek_hris/core/base/base_bloc.dart';
import 'package:ojrek_hris/core/base/bloc_event.dart';
import 'package:ojrek_hris/core/base/bloc_state.dart';
import 'package:flutter/foundation.dart';
import 'package:ojrek_hris/features/admin_features/crud_user_page/data/remote/get_department_position_response.dart' as dept;
import 'package:ojrek_hris/features/admin_features/crud_user_page/data/remote/get_user_response.dart' as usr;
import 'package:ojrek_hris/features/admin_features/crud_user_page/data/remote/get_user_response.dart';
import 'package:ojrek_hris/features/user_page/bloc/user_bloc.dart';

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
  }

  void getDataUser(event) async {
    emitState(LoadingState());
    await _repos.getDataUser(
      onSuccess: (List<usr.Data> user) {
        emitState(SuccesGetUser(user));
      },
      onError: (message, code) {
        emitState(ErrorGetUser());
        AlertMessage.showAlert(event.context,
            title: "Login Failed",
            message: "[$code] $message",
            type: CoolAlertType.error);
        if (code == 401) {
          UserBloc.logout();
        }
      },
    );
  }

  void getDepartmentPosition(event) async {
    emitState(LoadingState());
    await _repos.getDepartmenPosition(
      onSuccess: (List<dept.Data> dept) {
        emitState(SuccesGetDeptPos(dept));
      },
      onError: (message, code) {
        emitState(ErrorDeptPos());
        AlertMessage.showAlert(event.context,
            title: "Login Failed",
            message: "[$code] $message",
            type: CoolAlertType.error);
        if (code == 401) {
          UserBloc.logout();
        }
      },
    );
  }
}
