import 'package:ojrek_hris/core/base/base_bloc.dart';
import 'package:ojrek_hris/core/base/bloc_event.dart';
import 'package:ojrek_hris/core/base/bloc_state.dart';
import 'package:flutter/foundation.dart';

import '../domain/repository/home_repository.dart';
part 'home_state.dart';
part 'home_event.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  final HomeRepository _repos;
  bool isOnProcess = false;

  HomeBloc(this._repos);
  @override
  void mapEventToState(HomeEvent event) {
  }
}
