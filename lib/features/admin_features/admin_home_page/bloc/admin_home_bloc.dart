import 'package:ojrek_hris/core/base/base_bloc.dart';
import 'package:ojrek_hris/core/base/bloc_event.dart';
import 'package:ojrek_hris/core/base/bloc_state.dart';
import 'package:flutter/foundation.dart';

import '../domain/repository/admin_home_repository.dart';
part 'admin_home_state.dart';
part 'admin_home_event.dart';

class AdminHomeBloc extends BaseBloc<AdminHomeEvent, AdminHomeState> {
  final AdminHomeRepository _repos;
  bool isOnProcess = false;

  AdminHomeBloc(this._repos);
  @override
  void mapEventToState(AdminHomeEvent event) {
  }
}
