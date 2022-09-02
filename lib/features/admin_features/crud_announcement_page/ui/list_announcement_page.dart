import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/kiwi.dart';
import 'package:ojrek_hris/core/base/base_stateful.dart';
import 'package:ojrek_hris/core/widget/error_text.dart';

import '../../../../core/assets/my_color.dart';
import '../../../../core/assets/my_cons.dart';
import '../../../../core/assets/my_enum.dart';
import '../../../../core/routing/page_routing.dart';
import '../../../../core/widget/cool_alert.dart';
import '../../../../core/widget/styling.dart';
import '../bloc/crud_announcement_bloc.dart';
import '../data/remote/announcement_response.dart';

class ListAnnouncementPage extends StatefulWidget {
  @override
  _ListAnnouncementPage createState() => _ListAnnouncementPage();
}

class _ListAnnouncementPage extends BaseState<CrudAnnouncementBloc,
    CrudAnnouncementState, ListAnnouncementPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.5,
        title: Text("Announcements",
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
              child: StreamBuilder<CrudAnnouncementState>(
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
          await Get.toNamed(PageRouting.ADD_ANNOUNCEMENTS);
          bloc.pushEvent(GetAnnouncements(context));
        },
        backgroundColor: MyColors.mainColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget listAnnouncements(List<AnnouncementsData> dataDepartment) {
    // _dataUserFiltered = dataUser;
    // _dataUser.addAll(dataUser);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: dataDepartment.length,
      itemBuilder: (ctx, index) {
        return Container(
            color: MyCons.darkModeEnabled ? Colors.blueGrey[200] : Colors.white,
            child: announcementsList(ctx, dataDepartment.elementAt(index)));
      },
    );
  }

  Widget announcementsList(BuildContext ctx, AnnouncementsData elementAt) {
    return ExpansionTile(
      textColor: MyCons.darkModeEnabled ? Colors.blueGrey[600] : null,
      iconColor: MyCons.darkModeEnabled ? Colors.blueGrey[600] : null,
      collapsedIconColor: MyCons.darkModeEnabled ? Colors.blueGrey[600] : null,
      title: textWithIcon(
          icon: CupertinoIcons.bell_circle_fill,
          iconCustomColor:
              MyCons.darkModeEnabled ? Colors.blueGrey : MyColors.mainColor,
          text: "${elementAt.title}"),
      children: [
        // ListView.builder(
        //   shrinkWrap: true,
        //   itemCount: elementAt.position.length,
        //   itemBuilder: (ctx, index) {
        //     return Padding(
        //       padding: const EdgeInsets.only(
        //           top: 10, bottom: 10, left: 20.0, right: 20),
        //       child: itemList(ctx, elementAt.position.elementAt(index)),
        //     );
        //   },
        // ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              child: (elementAt.imgUrl != null)
                  ? Image.network(
                      elementAt.imgUrl!,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    )
                  : Center(
                      child: Text("No Image Detected"),
                    ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Expanded(
                      //   child: Container(
                      //     child: Text(
                      //       "${elementAt.subtitle}",
                      //       overflow: TextOverflow.ellipsis,
                      //       maxLines: 5,
                      //       style: styleHeader(
                      //           textStyleWeight: TextStyleWeight.body),
                      //     ),
                      //   ),
                      // ),
                      Text(
                        "${elementAt.subtitle}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        style:
                            styleHeader(textStyleWeight: TextStyleWeight.body),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        Container(
          color:
              MyCons.darkModeEnabled ? Colors.blueGrey[100] : Colors.grey[100],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  AlertMessage.showAlert(
                    context,
                    message:
                        "Are you sure you want to delete ${elementAt.title}??",
                    title: "Confirmation",
                    type: CoolAlertType.confirm,
                    confirmTxt: "Delete",
                    confirmBtnColor: Colors.red,
                    onConfirm: () {
                      Get.back();
                      if (elementAt.id != null)
                        bloc.pushEvent(CRUDAnnouncements(context,
                            announcementData: elementAt,
                            typeCrud: TypeCrud.DELETE));
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
                  await Get.toNamed(PageRouting.ADD_ANNOUNCEMENTS,
                      arguments: elementAt);
                  bloc.pushEvent(GetAnnouncements(context));
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
                        color: MyCons.darkModeEnabled
                            ? MyColors.mainColor
                            : Colors.white,
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

  // Widget itemList(BuildContext ctx, DataPosition elementAt) {
  //   return Text("${elementAt.name}");
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.pushEvent(GetAnnouncements(context));
  }

  @override
  CrudAnnouncementBloc initBloc() {
    // TODO: implement initBloc
    return KiwiContainer().resolve<CrudAnnouncementBloc>();
  }

  @override
  Widget mapStateHandler(CrudAnnouncementState? state) {
    // TODO: implement mapStateHandler
    if (state is LoadingState) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is SuccessGetAnnouncements) {
      // _dataUser = state.dataUser;
      if (state.listAnnouncements!.isEmpty) {
        return ErrorText(message: "No Announcements found at this time");
      } else {
        return listAnnouncements(state.listAnnouncements!);
      }
    }

    // if (state is SuccesGetDepartmentFilter) {
    //   // _dataUserFiltered = state.dataUser;
    //   return listUser(_dataUserFiltered);
    // }

    if (state is ErrorGetAnnouncements) {
      return ErrorText(
          message: "Something wrong, try again",
          tryAgain: () {
            bloc.pushEvent(GetAnnouncements(context));
          });
    }

    return Container();
  }
}
