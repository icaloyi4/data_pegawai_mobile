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
import '../../../../core/utils/utils.dart';
import '../../../../core/widget/cool_alert.dart';
import '../../../../core/widget/styling.dart';
import '../bloc/crud_news_bloc.dart';
import '../data/remote/news_response.dart';

class ListNewsPage extends StatefulWidget {
  @override
  _ListNewsPage createState() => _ListNewsPage();
}

class _ListNewsPage
    extends BaseState<CrudNewsBloc, CrudNewsState, ListNewsPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.5,
        title: Text("News",
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
              child: StreamBuilder<CrudNewsState>(
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
          await Get.toNamed(PageRouting.ADD_NEWS);
          bloc.pushEvent(GetNews(context));
        },
        backgroundColor: MyColors.mainColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget listNews(List<NewsData> dataDepartment) {
    // _dataUserFiltered = dataUser;
    // _dataUser.addAll(dataUser);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: dataDepartment.length,
      itemBuilder: (ctx, index) {
        return Container(
            color: MyCons.darkModeEnabled ? Colors.blueGrey[200] : Colors.white,
            child: newsList(ctx, dataDepartment.elementAt(index)));
      },
    );
  }

  Widget newsList(BuildContext ctx, NewsData elementAt) {
    return ExpansionTile(
      textColor: MyCons.darkModeEnabled ? Colors.blueGrey[600] : null,
      iconColor: MyCons.darkModeEnabled ? Colors.blueGrey[600] : null,
      collapsedIconColor: MyCons.darkModeEnabled ? Colors.blueGrey[600] : null,
      title: textWithIcon(
          icon: CupertinoIcons.news,
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
                      fit: BoxFit.cover,loadingBuilder: (BuildContext context,
                          Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    }
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
                      Text(
                        "${elementAt.updateBy} - ${changeDateFormat(date: elementAt.updateAt, newFormat: MyCons.DATETIME_FORMAT_BEAUTY)}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        Container(
          color: MyCons.darkModeEnabled ? Colors.blueGrey[100] : Colors.grey[100],
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
                        bloc.pushEvent(CRUDNews(context,
                            newsData: elementAt, typeCrud: TypeCrud.DELETE));
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
                  await Get.toNamed(PageRouting.ADD_NEWS, arguments: elementAt);
                  bloc.pushEvent(GetNews(context));
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
    bloc.pushEvent(GetNews(context));
  }

  @override
  CrudNewsBloc initBloc() {
    // TODO: implement initBloc
    return KiwiContainer().resolve<CrudNewsBloc>();
  }

  @override
  Widget mapStateHandler(CrudNewsState? state) {
    // TODO: implement mapStateHandler
    if (state is LoadingState) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is SuccessGetNews) {
      // _dataUser = state.dataUser;
      return listNews(state.listNews!);
    }

    // if (state is SuccesGetDepartmentFilter) {
    //   // _dataUserFiltered = state.dataUser;
    //   return listUser(_dataUserFiltered);
    // }

    if (state is ErrorGetNews) {
      return ErrorText(
          message: "Something wrong, try again",
          tryAgain: () {
            bloc.pushEvent(GetNews(context));
          });
    }

    return Container();
  }
}
