import 'package:ojrek_hris/core/base/base_bloc.dart';
import 'package:ojrek_hris/core/base/bloc_event.dart';
import 'package:ojrek_hris/core/base/bloc_state.dart';
import 'package:flutter/foundation.dart';

import '../domain/repository/register_repository.dart';
part 'register_state.dart';
part 'register_event.dart';

class RegisterBloc extends BaseBloc<RegisterEvent, RegisterState> {
  final RegisterRepository _repos;
  bool isOnProcess = false;

  RegisterBloc(this._repos);
  @override
  void mapEventToState(RegisterEvent event) {
  }
}
