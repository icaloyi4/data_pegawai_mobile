import 'package:ojrek_hris/core/base/base_bloc.dart';
import 'package:ojrek_hris/core/base/bloc_event.dart';
import 'package:ojrek_hris/core/base/bloc_state.dart';
import 'package:flutter/foundation.dart';

import '../domain/repository/company_repository.dart';
part 'company_state.dart';
part 'company_event.dart';

class CompanyBloc extends BaseBloc<CompanyEvent, CompanyState> {
  final CompanyRepository _repos;
  bool isOnProcess = false;

  CompanyBloc(this._repos);
  @override
  void mapEventToState(CompanyEvent event) {
  }
}
