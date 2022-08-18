import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ojrek_hris/core/assets/my_cons.dart';
import 'package:ojrek_hris/core/base/base_bloc.dart';
import 'package:ojrek_hris/core/base/bloc_event.dart';
import 'package:ojrek_hris/core/base/bloc_state.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/routing/page_routing.dart';
import '../../../../core/widget/cool_alert.dart';
import '../data/remote/news_response.dart';
import '../domain/repository/crud_news_repository.dart';

part 'crud_news_state.dart';
part 'crud_news_event.dart';

class CrudNewsBloc extends BaseBloc<CrudNewsEvent, CrudNewsState> {
  final CrudNewsRepository _repos;
  bool isOnProcess = false;

  CrudNewsBloc(this._repos);
  @override
  void mapEventToState(CrudNewsEvent event) {
    if (event is GetNews) {
      getNews(event);
    }
    if (event is CRUDNews) {
      createUpdateNews(event);
    }
  }

  void getNews(GetNews event) async {
    emitState(LoadingState());
    await _repos.getNews(
      limit: event.limit,
      onSuccess: (news) {
        emitState(SuccessGetNews(news));
      },
      onError: (message, code) {
        emitState(ErrorGetNews());
        AlertMessage.showAlert(event.context,
            title: "Failed",
            message: "[$code] $message",
            type: CoolAlertType.error);
      },
    );
  }

  void createUpdateNews(CRUDNews event) async {
    emitState(LoadingState());
    await _repos.crudNews(
      typeCrud: event.typeCrud,
      newsData: event.newsData,
      onSuccess: (news) {
        emitState(SuccessCreateUpdateNews());
        AlertMessage.showAlert(
          event.context,
          title: "Success",
          message: "News already registered",
          type: CoolAlertType.success,
          confirmTxt: "Continue",
          onConfirm: () {
            // Navigator.of(event.context).pop();
            if (event.typeCrud == TypeCrud.DELETE) {
              getNews(new GetNews(event.context));
              if (Get.currentRoute == PageRouting.CRUD_NEWS)
                Get.back(closeOverlays: true);
              return;
            }
            if (Get.currentRoute == PageRouting.ADD_NEWS)
              Get.back(closeOverlays: true);
            if (Get.currentRoute == PageRouting.ADD_NEWS)
              Get.back(closeOverlays: true);
          },
        );
      },
      onError: (message, code) {
        emitState(ErrorCreateUpdateNews());
        AlertMessage.showAlert(event.context,
            title: "Failed",
            message: "[$code] $message",
            type: CoolAlertType.error);
      },
    );
  }
}
