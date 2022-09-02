import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/kiwi.dart';

import '../../../../core/assets/my_cons.dart';
import '../../../../core/assets/my_enum.dart';
import '../../../../core/base/base_stateful.dart';
import '../../../../core/widget/error_text.dart';
import '../../../../core/widget/styling.dart';
import '../bloc/crud_announcement_bloc.dart';
import 'widget/form_crud_announcement_page.dart';

class CrudAnnouncementPage extends StatefulWidget {
  @override
  _CrudAnnouncementName createState() => _CrudAnnouncementName();
}

class _CrudAnnouncementName extends BaseState<CrudAnnouncementBloc,
    CrudAnnouncementState, CrudAnnouncementPage> {
  bool _isUpdate = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.5,
        title: Text(
            "${_isUpdate ? "Update Announcement" : "Create New Announcement"}",
            style: styleHeader(
                textStyleWeight: TextStyleWeight.Title3,
                color: MyCons.darkModeEnabled ? Colors.white : Colors.black54)),
      ),
      body: StreamBuilder<CrudAnnouncementState>(
          stream: bloc.stateStream,
          initialData: LoadingState(),
          builder: (blocCtx, snapshot) => mapStateHandler(snapshot.data)),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.pushEvent(GetDepartment(context));
    _isUpdate = Get.arguments != null;
  }

  @override
  CrudAnnouncementBloc initBloc() {
    // TODO: implement initBloc
    return KiwiContainer().resolve<CrudAnnouncementBloc>();
  }

  @override
  Widget mapStateHandler(CrudAnnouncementState? state) {
    if (state is LoadingState) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is SuccesGetDept) {
      if (state.dataDept.isEmpty) {
        return Center(
          child: Text(
            "Please input department data first",
            style: styleHeader(textStyleWeight: TextStyleWeight.Title3),
          ),
        );
      }
      return FormCrudAnnouncementPage(
        dataDept: state.dataDept,
      );
    }

    if (state is ErrorDept) {
      return Center(
          child: ErrorText(
              message: "Something Wrong, tap to try again",
              tryAgain: () {
                bloc.pushEvent(GetDepartment(context));
              }));
    }

    return Container();
  }
}
