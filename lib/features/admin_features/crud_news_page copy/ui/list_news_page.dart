import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:ojrek_hris/core/base/base_stateful.dart';
import 'package:ojrek_hris/features/admin_features/crud_news_page%20copy/bloc/crud_news_bloc.dart';

class ListNewsPage extends StatefulWidget {
  @override
  _ListNewsPage createState() => _ListNewsPage();
}

class _ListNewsPage
    extends BaseState<CrudNewsBloc, CrudNewsState, ListNewsPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  CrudNewsBloc initBloc() {
    return KiwiContainer().resolve<CrudNewsBloc>();
  }

  @override
  Widget mapStateHandler(CrudNewsState? state) {
    // TODO: implement mapStateHandler
    throw UnimplementedError();
  }
}
