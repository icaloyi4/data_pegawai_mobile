import 'package:ojrek_hris/core/base/base_bloc.dart';
import 'package:ojrek_hris/core/base/bloc_event.dart';
import 'package:ojrek_hris/core/base/bloc_state.dart';
import 'package:flutter/foundation.dart';

import '../domain/repository/crud_department_repository.dart';
part 'crud_department_state.dart';
part 'crud_department_event.dart';

class CrudDepartmentBloc extends BaseBloc<CrudDepartmentEvent, CrudDepartmentState> {
  final CrudDepartmentRepository _repos;
  bool isOnProcess = false;

  CrudDepartmentBloc(this._repos);
  @override
  void mapEventToState(CrudDepartmentEvent event) {
  }
}
