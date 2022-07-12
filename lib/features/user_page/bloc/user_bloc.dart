import 'package:ojrek_hris/core/base/base_bloc.dart';
import 'package:ojrek_hris/core/base/bloc_event.dart';
import 'package:ojrek_hris/core/base/bloc_state.dart';
import 'package:flutter/foundation.dart';

import '../domain/repository/user_repository.dart';
part 'user_state.dart';
part 'user_event.dart';

class UserBloc extends BaseBloc<UserEvent, UserState> {
  final UserRepository _repos;
  bool isOnProcess = false;

  UserBloc(this._repos);
  @override
  void mapEventToState(UserEvent event) {
  }
}
