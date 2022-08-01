import 'package:ojrek_hris/core/base/base_bloc.dart';
import 'package:ojrek_hris/core/base/bloc_event.dart';
import 'package:ojrek_hris/core/base/bloc_state.dart';
import 'package:flutter/foundation.dart';

import '../domain/repository/crud_position_repository.dart';

part 'crud_position_state.dart';
part 'crud_position_event.dart';

class CrudPositionBloc extends BaseBloc<CrudPositionEvent, CrudPositionState> {
  final CrudPositionRepository _repos;
  bool isOnProcess = false;

  CrudPositionBloc(this._repos);
  @override
  void mapEventToState(CrudPositionEvent event) {
  }
}
