import 'package:clean_architecture_null_safety/core/assets/my_color.dart';
import 'package:clean_architecture_null_safety/core/assets/my_cons.dart';
import 'package:clean_architecture_null_safety/core/base/base_stateful.dart';
import 'package:clean_architecture_null_safety/features/user_page/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPage createState() => _UserPage();
}

class _UserPage extends BaseState<UserBloc, UserState, UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: myAppBar("EMPLOYEE PORTAL", action),
      appBar: AppBar(
        backgroundColor:
            MyCons.darkModeEnabled ? MyColors.mainColor10 : MyColors.mainColor,
        actions: [
          GestureDetector(
            // child: Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Icon(Icons.settings),
            // ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.exit_to_app),
            ),
            onTap: () {
              // Get.toNamed(PageRouting.SETTING);
              // showDialogTwoOption(context, "Peringatan", "Batal", "Lanjutkan",
              //     onLeft: (ctxnya) {
              //       Navigator.pop(ctxnya);
              //     },
              //     message: "Apakah anda yakin ingin keluar?",
              //     onRight: (ctxnya) {
              //       Navigator.pop(ctxnya);
              //       logout();
              //     });
            },
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // Image.asset(MyImages.mainLogo2, height: 40),
              Expanded(child: Center(child: Text("EMPLOYEE PORTAL")))
            ],
          ),
        ),
      ),
      body: StreamBuilder<UserState>(
          stream: bloc.stateStream,
          initialData: LoadingState(),
          builder: (blocCtx, snapshot) => mapStateHandler(snapshot.data)),
    );
  }

  @override
  UserBloc initBloc() {
    return KiwiContainer().resolve<UserBloc>();
  }

  @override
  void initState() {
    super.initState();
    bloc.pushEvent(GetDataUser("-", "-"));
  }

  // List<Widget> action = [
  //   GestureDetector(
  //     child: Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Icon(Icons.exit_to_app),
  //     ),
  //     onTap: () => logout(),
  //   ),
  // ];

  void logout() {
    bloc.pushEvent(Logout());
  }

  @override
  Widget mapStateHandler(UserState? state) {
    // if (state is SuccessGetDataUser) {
    //   return Column(
    //     children: [
    //       HeaderUser(
    //         user: state.user,
    //       ),
    //       Expanded(
    //         child: FormUser(
    //           user: state.user,
    //           overtime: state.overtime,
    //         ),
    //       )
    //     ],
    //   );
    // } else {
    //   return Center(child: CircularProgressIndicator());
    // }
    return Container();
  }
}
