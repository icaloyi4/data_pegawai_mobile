import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/kiwi.dart';
import 'package:ojrek_hris/core/assets/my_color.dart';
import 'package:ojrek_hris/core/base/base_stateful.dart';
import 'package:ojrek_hris/core/widget/styling.dart';

import '../../../../core/assets/my_cons.dart';
import '../../../../core/routing/page_routing.dart';
import '../../../../core/widget/cool_alert.dart';
import '../bloc/crud_department_bloc.dart';
import '../data/remote/get_department_position_response.dart';

class ListDepartmentPage extends StatefulWidget {
  @override
  _ListDepartmentPage createState() => _ListDepartmentPage();
}

class _ListDepartmentPage extends BaseState<CrudDepartmentBloc,
    CrudDepartmentState, ListDepartmentPage> {
  late List<DataDepartment> _dataUserFiltered;
  late List<DataDepartment> _dataUser;
  // List<DataUser> _user = [];

  @override
  void initState() {
    super.initState();
    bloc.pushEvent(GetDepartmenPosition(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.5,
        title: Text("Department",
            style: styleHeader(
                textStyleWeight: TextStyleWeight.Title3,
                color: MyCons.darkModeEnabled ? Colors.white : Colors.black54)),
      ),
      body: Column(
        children: [
          // Container(
          //   color: Colors.white,
          //   child: Padding(
          //     padding: const EdgeInsets.all(15.0),
          //     child: Container(
          //       child: TextFormField(
          //         decoration:
          //             fieldDecoration("Search", icon: CupertinoIcons.search),
          //         onChanged: (value) {
          //           // bloc.pushEvent(FilterUser(value, _dataUser));
          //         },
          //       ),
          //     ),
          //   ),
          // ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder<CrudDepartmentState>(
                  stream: bloc.stateStream,
                  initialData: LoadingState(),
                  builder: (blocCtx, snapshot) =>
                      mapStateHandler(snapshot.data)),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Get.toNamed(PageRouting.ADD_DEPARTMENT);
          bloc.pushEvent(GetDepartmenPosition(context));
        },
        backgroundColor: MyColors.mainColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget listUser(List<DataDepartment> dataDepartment) {
    // _dataUserFiltered = dataUser;
    // _dataUser.addAll(dataUser);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: dataDepartment.length,
      itemBuilder: (ctx, index) {
        return Container(
            color: Colors.white,
            child: departmentList(ctx, dataDepartment.elementAt(index)));
      },
    );
  }

  Widget departmentList(BuildContext ctx, DataDepartment elementAt) {
    return ExpansionTile(
      textColor: MyCons.darkModeEnabled ? Colors.blueGrey[600] : null,
      title: textWithIcon(
          icon: CupertinoIcons.building_2_fill,
          iconCustomColor:
              MyCons.darkModeEnabled ? Colors.blueGrey : MyColors.mainColor,
          text: "${elementAt.name}"),
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: elementAt.position.length,
          itemBuilder: (ctx, index) {
            return Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 20.0, right: 20),
              child: itemList(ctx, elementAt.position.elementAt(index)),
            );
          },
        ),
        Container(
          color: Colors.grey[100],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  AlertMessage.showAlert(
                    context,
                    message:
                        "Are you sure you want to delete ${elementAt.name}??",
                    title: "Confirmation",
                    type: CoolAlertType.confirm,
                    confirmTxt: "Delete",
                    confirmBtnColor: Colors.red,
                    onConfirm: () {
                      Get.back();
                      if (elementAt.id != null)
                        bloc.pushEvent(
                            DeleteDepartment(context, elementAt.id!));
                    },
                    onCancel: () {
                      Get.back();
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: styleBoxBorderAll(
                        backgroundColor: Colors.transparent,
                        withBorder: true,
                        borderColors: Colors.red),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        CupertinoIcons.trash,
                        size: 20,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await Get.toNamed(PageRouting.ADD_DEPARTMENT,
                      arguments: elementAt);
                  bloc.pushEvent(GetDepartmenPosition(context));
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: styleBoxBorderAll(
                        backgroundColor: Colors.transparent,
                        withBorder: true,
                        borderColors: MyColors.mainColor),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        CupertinoIcons.pencil,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget itemList(BuildContext ctx, DataPosition elementAt) {
    return Text("${elementAt.name}");
  }

  @override
  CrudDepartmentBloc initBloc() {
    // TODO: implement initBloc
    return KiwiContainer().resolve<CrudDepartmentBloc>();
  }

  @override
  Widget mapStateHandler(CrudDepartmentState? state) {
    // TODO: implement mapStateHandler
    if (state is LoadingState) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is SuccesGetDeptPos) {
      // _dataUser = state.dataUser;
      return listUser(state.dataDept);
    }

    // if (state is SuccesGetDepartmentFilter) {
    //   // _dataUserFiltered = state.dataUser;
    //   return listUser(_dataUserFiltered);
    // }

    if (state is ErrorGetDepartment) {
      return Center(
        child: Text(
          "Something wrong",
          style: styleHeader(textStyleWeight: TextStyleWeight.Title2),
        ),
      );
    }

    return Container();
  }
}
