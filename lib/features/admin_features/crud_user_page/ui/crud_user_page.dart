import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:ojrek_hris/core/base/base_stateful.dart';
import 'package:ojrek_hris/features/admin_features/crud_user_page/bloc/crud_user_bloc.dart';

import '../../../../core/assets/my_cons.dart';
import '../../../../core/widget/styling.dart';
import 'widget/form_crud_user.dart';

class CrudUserPage extends StatefulWidget {
  @override
  _CrudUserName createState() => _CrudUserName();
}

class _CrudUserName
    extends BaseState<CrudUserBloc, CrudUserState, CrudUserPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.5,
        title: Text("Add New Employee",
            style: styleHeader(
                textStyleWeight: TextStyleWeight.Title3,
                color: MyCons.darkModeEnabled ? Colors.white : Colors.black54)),
      ),
      body: StreamBuilder<CrudUserState>(
          stream: bloc.stateStream,
          initialData: LoadingState(),
          builder: (blocCtx, snapshot) => mapStateHandler(snapshot.data)),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.pushEvent(GetDepartmenPosition(context));
  }

  @override
  CrudUserBloc initBloc() {
    // TODO: implement initBloc
    return KiwiContainer().resolve<CrudUserBloc>();
  }

  @override
  Widget mapStateHandler(CrudUserState? state) {
    if (state is LoadingState) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is SuccesGetDeptPos) {
      if (state.dataDept.isEmpty) {
        return Center(
          child: Text(
            "Please input department data first",
            style: styleHeader(textStyleWeight: TextStyleWeight.Title3),
          ),
        );
      }
      return FormCrudUserPage(state.dataDept);
    }

    if (state is ErrorDeptPos)
      return Center(
        child: Text(
          "Something Wrong",
          style: styleHeader(textStyleWeight: TextStyleWeight.Title3),
        ),
      );

    return Container();
  }
}
