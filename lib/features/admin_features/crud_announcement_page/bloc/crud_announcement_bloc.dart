import 'package:ojrek_hris/core/base/base_bloc.dart';
import 'package:ojrek_hris/core/base/bloc_event.dart';
import 'package:ojrek_hris/core/base/bloc_state.dart';
import 'package:flutter/foundation.dart';

import '../domain/repository/crud_announcement_repository.dart';

part 'crud_announcement_state.dart';
part 'crud_announcement_event.dart';

class CrudAnnouncementBloc extends BaseBloc<CrudAnnouncementEvent, CrudAnnouncementState> {
  final CrudAnnouncementRepository _repos;
  bool isOnProcess = false;

  CrudAnnouncementBloc(this._repos);
  @override
  void mapEventToState(CrudAnnouncementEvent event) {
  }
}
