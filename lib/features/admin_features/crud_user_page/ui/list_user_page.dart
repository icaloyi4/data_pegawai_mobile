import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:kiwi/kiwi.dart';
import 'package:ojrek_hris/core/assets/my_color.dart';
import 'package:ojrek_hris/core/base/base_stateful.dart';
import 'package:ojrek_hris/core/routing/page_routing.dart';
import 'package:ojrek_hris/core/widget/styling.dart';
import 'package:ojrek_hris/features/admin_features/crud_user_page/bloc/crud_user_bloc.dart';
import 'package:ojrek_hris/features/admin_features/crud_user_page/data/remote/get_user_response.dart';

import '../../../../core/assets/my_cons.dart';
import '../../../../core/utils/utils.dart';

class ListUserPage extends StatefulWidget {
  @override
  _ListUserPage createState() => _ListUserPage();
}

class _ListUserPage
    extends BaseState<CrudUserBloc, CrudUserState, ListUserPage> {
  // List<DataUser> _user = [];

  @override
  void initState() {
    // TODO: implement initState
    // _user.add(new DataUser(
    //     user: new User(name: "Rizky Haris Risaldi"),
    //     department: new Department(name: "IT Department")));
    // _user.add(new DataUser(
    //     user: new User(name: "Ferran Torres"),
    //     department: new Department(name: "IT Department")));
    // _user.add(new DataUser(
    //     user: new User(name: "Sugeng Sulaiman"),
    //     department: new Department(name: "Human Resource")));
    // _user.add(new DataUser(
    //     user: new User(name: "Mokodompit Rifky"),
    //     department: new Department(name: "Human Resource")));
    // _user.add(new DataUser(
    //     user: new User(name: "Subagyo"),
    //     department: new Department(name: "Holder")));
    // _user.add(new DataUser(
    //     user: new User(name: "Rizky Haris Risaldi"),
    //     department: new Department(name: "IT Department")));
    // _user.add(new DataUser(
    //     user: new User(name: "Ferran Torres"),
    //     department: new Department(name: "IT Department")));
    // _user.add(new DataUser(
    //     user: new User(name: "Sugeng Sulaiman"),
    //     department: new Department(name: "Human Resource")));
    // _user.add(new DataUser(
    //     user: new User(name: "Mokodompit Rifky"),
    //     department: new Department(name: "Human Resource")));
    // _user.add(new DataUser(
    //     user: new User(name: "Subagyo"),
    //     department: new Department(name: "Holder")));
    // _user.add(new DataUser(
    //     user: new User(name: "Rizky Haris Risaldi"),
    //     department: new Department(name: "IT Department")));
    // _user.add(new DataUser(
    //     user: new User(name: "Ferran Torres"),
    //     department: new Department(name: "IT Department")));
    // _user.add(new DataUser(
    //     user: new User(name: "Sugeng Sulaiman"),
    //     department: new Department(name: "Human Resource")));
    // _user.add(new DataUser(
    //     user: new User(name: "Mokodompit Rifky"),
    //     department: new Department(name: "Human Resource")));
    // _user.add(new DataUser(
    //     user: new User(name: "Subagyo"),
    //     department: new Department(name: "Holder")));

    super.initState();
    bloc.pushEvent(GetDataCrudUser(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.5,
        title: Text("Employee",
            style: styleHeader(
                textStyleWeight: TextStyleWeight.Title3,
                color: MyCons.darkModeEnabled ? Colors.white : Colors.black54)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        // child: ListView.builder(
        //   shrinkWrap: true,
        //   itemCount: _user.length,
        //   itemBuilder: (ctx, index) {
        //     return itemList(ctx, _user.elementAt(index), index);
        //   },
        // ),
        child: StreamBuilder<CrudUserState>(
            stream: bloc.stateStream,
            initialData: LoadingState(),
            builder: (blocCtx, snapshot) => mapStateHandler(snapshot.data)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Get.toNamed(PageRouting.ADD_USER);
          bloc.pushEvent(GetDataCrudUser(context));
        },
        backgroundColor: MyColors.mainColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget listUser(List<Data> dataUser) {
    return GroupedListView<dynamic, String>(
      elements: dataUser,
      groupBy: (element) {
        return element.department.toString();
      },
      groupSeparatorBuilder: (String groupByValue) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "${groupByValue != "null" ? groupByValue : "-"}",
            style: styleHeader(textStyleWeight: TextStyleWeight.subtitle2),
          ),
        );
      },
      itemBuilder: (ctx, element) {
        return itemList(ctx, element);
      },
      itemComparator: (item1, item2) {
        print(item1.department.compareTo(item1.department));
        return item1.department.compareTo(item1.department);
      }, // optional
      // useStickyGroupSeparators: true, // optional // optional
      order: GroupedListOrder.ASC, // optional
    );
  }

  Widget itemList(BuildContext ctx, Data elementAt) {
    return Container(
      color: MyCons.darkModeEnabled ? Colors.blueGrey[200] : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          // decoration: styleBoxUnderline(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 75,
                  height: 75,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: MyColors.mainColor10, // border color
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "${getInitial(
                      pattern: ' ',
                      value: elementAt.name,
                    )}",
                    style: styleHeader(
                        color: MyCons.darkModeEnabled
                            ? Colors.blueGrey
                            : MyColors.mainColor,
                        textStyleWeight: TextStyleWeight.Title2),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                Expanded(
                    child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 2),
                        child: Text(
                          "${elementAt.name}",
                          overflow: TextOverflow.ellipsis,
                          style: styleHeader(
                              textStyleWeight: TextStyleWeight.Title3),
                        ),
                      ),
                      Text(
                        "${elementAt.position != null ? elementAt.position : "Not assigned"}",
                        overflow: TextOverflow.ellipsis,
                        style:
                            styleHeader(textStyleWeight: TextStyleWeight.body),
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  CrudUserBloc initBloc() {
    // TODO: implement initBloc
    return KiwiContainer().resolve<CrudUserBloc>();
  }

  @override
  Widget mapStateHandler(CrudUserState? state) {
    // TODO: implement mapStateHandler
    if (state is LoadingState) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is SuccesGetUser) {
      return listUser(state.dataUser);
    }

    if (state is ErrorGetUser) {
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
