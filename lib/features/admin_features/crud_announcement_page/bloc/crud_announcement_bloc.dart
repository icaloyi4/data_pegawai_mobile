import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ojrek_hris/core/base/base_bloc.dart';
import 'package:ojrek_hris/core/base/bloc_event.dart';
import 'package:ojrek_hris/core/base/bloc_state.dart';
import 'package:ojrek_hris/features/admin_features/crud_announcement_page/data/remote/announcement_response.dart';
import 'package:ojrek_hris/features/admin_features/crud_announcement_page/data/remote/get_department_response.dart';

import '../../../../core/assets/my_enum.dart';
import '../../../../core/routing/page_routing.dart';
import '../../../../core/widget/cool_alert.dart';
import '../domain/repository/crud_announcement_repository.dart';

part 'crud_announcement_state.dart';
part 'crud_announcement_event.dart';

class CrudAnnouncementBloc
    extends BaseBloc<CrudAnnouncementEvent, CrudAnnouncementState> {
  final CrudAnnouncementRepository _repos;
  bool isOnProcess = false;

  CrudAnnouncementBloc(this._repos);
  @override
  void mapEventToState(CrudAnnouncementEvent event) {
    if (event is GetAnnouncements) {
      getAnnouncements(event);
    }

    if (event is GetDepartment) {
      getDepatment(event);
    }
    if (event is CRUDAnnouncements) {
      createUpdateAnnouncement(event);
    }
  }

  void getAnnouncements(GetAnnouncements event) async {
    emitState(LoadingState());
    await _repos.getAnnouncements(
      onSuccess: (announcements) {
        emitState(SuccessGetAnnouncements(announcements));
      },
      onError: (message, code) {
        emitState(ErrorGetAnnouncements());
        AlertMessage.showAlert(event.context,
            title: "Failed",
            message: "[$code] $message",
            type: CoolAlertType.error);
      },
    );
  }

  void createUpdateAnnouncement(CRUDAnnouncements event) async {
    emitState(LoadingState());
    await _repos.crudAnnouncement(
      typeCrud: event.typeCrud,
      announcementsData: event.announcementData,
      onSuccess: (announcements) {
        emitState(SuccessCreateUpdateAnnouncements());
        AlertMessage.showAlert(
          event.context,
          title: "Success",
          message: "News already registered",
          type: CoolAlertType.success,
          confirmTxt: "Continue",
          onConfirm: () {
            // Navigator.of(event.context).pop();
            if (event.typeCrud == TypeCrud.DELETE) {
              getAnnouncements(new GetAnnouncements(event.context));
              if (Get.currentRoute == PageRouting.CRUD_ANNOUNCEMENTS)
                Get.back(closeOverlays: true);
              return;
            }
            if (Get.currentRoute == PageRouting.ADD_ANNOUNCEMENTS)
              Get.back(closeOverlays: true);
            if (Get.currentRoute == PageRouting.ADD_ANNOUNCEMENTS)
              Get.back(closeOverlays: true);
          },
        );
      },
      onError: (message, code) {
        emitState(ErrorCreateUpdateAnnouncements());
        AlertMessage.showAlert(event.context,
            title: "Failed",
            message: "[$code] $message",
            type: CoolAlertType.error);
      },
    );
  }

  void getDepatment(GetDepartment event) async {
    emitState(LoadingState());
    await _repos.getDepartment(
      onSuccess: (department) {
        emitState(SuccesGetDept(department));
      },
      onError: (message, code) {
        emitState(ErrorDept());
        AlertMessage.showAlert(event.context,
            title: "Failed",
            message: "[$code] $message",
            type: CoolAlertType.error);
      },
    );
  }
}
