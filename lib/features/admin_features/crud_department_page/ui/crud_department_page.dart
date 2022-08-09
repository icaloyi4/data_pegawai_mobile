import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/kiwi.dart';
import 'package:ojrek_hris/core/widget/styling.dart';

import '../../../../core/assets/my_cons.dart';
import '../../../../core/base/base_stateful.dart';
import '../bloc/crud_department_bloc.dart';
import 'widget/form_crud_department.dart';

class CrudDepartmentPage extends StatefulWidget {
  @override
  _CrudDepartmentName createState() => _CrudDepartmentName();
}

class _CrudDepartmentName extends State<CrudDepartmentPage> {
  bool _isUpdate = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.5,
        title: Text(_isUpdate ? "Edit Department" : "Add Department",
            style: styleHeader(
                textStyleWeight: TextStyleWeight.Title3,
                color: MyCons.darkModeEnabled ? Colors.white : Colors.black54)),
      ),
      body: FormCrudDepartmentPage(),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // bloc.pushEvent(GetDepartmenPosition(context));
    _isUpdate = Get.arguments != null;
  }

  // @override
  // CrudDepartmentBloc initBloc() {
  //   // TODO: implement initBloc
  //   return KiwiContainer().resolve<CrudDepartmentBloc>();
  // }

  // @override
  // Widget mapStateHandler(CrudDepartmentState? state) {
  //   if (state is LoadingState) {
  //     return Center(
  //       child: CircularProgressIndicator(),
  //     );
  //   }

  //   if (state is SuccesGetDeptPos) {
  //     if (state.dataDept.isEmpty) {
  //       return Center(
  //         child: Text(
  //           "Please input department data first",
  //           style: styleHeader(textStyleWeight: TextStyleWeight.Title3),
  //         ),
  //       );
  //     }
  //     return FormCrudDepartmentPage();
  //   }

  //   if (state is ErrorDeptPos)
  //     return Center(
  //       child: Text(
  //         "Something Wrong",
  //         style: styleHeader(textStyleWeight: TextStyleWeight.Title3),
  //       ),
  //     );

  //   return Container();
  // }
}
