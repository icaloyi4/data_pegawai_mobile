import 'package:ojrek_hris/core/base/base_bloc.dart';
import 'package:ojrek_hris/core/base/bloc_event.dart';
import 'package:ojrek_hris/core/base/bloc_state.dart';
import 'package:flutter/foundation.dart';

import '../domain/repository/login_repository.dart';
part 'login_state.dart';
part 'login_event.dart';

class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  final LoginRepository _repos;
  bool isOnProcess = false;

  LoginBloc(this._repos);
  @override
  void mapEventToState(LoginEvent event) {
  }
}
