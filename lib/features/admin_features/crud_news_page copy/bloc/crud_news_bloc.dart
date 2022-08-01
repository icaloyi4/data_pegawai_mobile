import 'package:ojrek_hris/core/base/base_bloc.dart';
import 'package:ojrek_hris/core/base/bloc_event.dart';
import 'package:ojrek_hris/core/base/bloc_state.dart';
import 'package:flutter/foundation.dart';

import '../domain/repository/crud_news_repository.dart';

part 'crud_news_state.dart';
part 'crud_news_event.dart';

class CrudNewsBloc extends BaseBloc<CrudNewsEvent, CrudNewsState> {
  final CrudNewsRepository _repos;
  bool isOnProcess = false;

  CrudNewsBloc(this._repos);
  @override
  void mapEventToState(CrudNewsEvent event) {
  }
}
