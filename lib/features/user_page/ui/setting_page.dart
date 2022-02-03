// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:hris_mobile/core/assets/my_color.dart';
// import 'package:hris_mobile/core/assets/my_cons.dart';
// import 'package:hris_mobile/core/assets/my_images.dart';
// import 'package:hris_mobile/core/base/base_stateful.dart';
// import 'package:hris_mobile/core/widget/alert_dialog.dart';
// import 'package:hris_mobile/core/widget/styling.dart';
// import 'package:hris_mobile/features/user_page/bloc/user_bloc.dart';
// import 'package:hris_mobile/features/user_page/data/local/setting_model.dart';
// import 'package:hris_mobile/features/user_page/ui/widget/dark_mode_setting.dart';
// import 'package:hris_mobile/features/user_page/ui/widget/notif_setting.dart';
// import 'package:kiwi/kiwi.dart';

// class SettingPage extends StatefulWidget {
//   @override
//   _SettingPage createState() => _SettingPage();
// }

// class _SettingPage extends BaseState<UserBloc, UserState, SettingPage> {
//   List<SettingModel> _setting_widget = [];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: myAppBar("EMPLOYEE PORTAL", action),
//       appBar: AppBar(
//         backgroundColor:
//             MyCons.darkModeEnabled ? MyColors.mainColor10 : MyColors.mainColor,
//         actions: [
//           GestureDetector(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Icon(Icons.exit_to_app),
//             ),
//             onTap: () {
//               showDialogTwoOption(context, "Peringatan", "Batal", "Lanjutkan",
//                   onLeft: (ctxnya) {
//                     Navigator.pop(ctxnya);
//                   },
//                   message: "Apakah anda yakin ingin keluar?",
//                   onRight: (ctxnya) {
//                     Navigator.pop(ctxnya);
//                     logout();
//                   });
//             },
//           ),
//         ],
//         title: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             children: [
//               // Image.asset(MyImages.mainLogo2, height: 40),
//               Expanded(child: Text("Setting"))
//             ],
//           ),
//         ),
//       ),
//       // body: StreamBuilder<UserState>(
//       //     stream: bloc.stateStream,
//       //     initialData: LoadingState(),
//       //     builder: (blocCtx, snapshot) => mapStateHandler(snapshot.data)),
//       body: Container(
//         color: MyCons.darkModeEnabled ? Colors.transparent : Colors.white,
//         child: ListView.builder(
//           physics: NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           itemCount: _setting_widget.length,
//           itemBuilder: (context, index) {
//             return itemListTeam(_setting_widget.elementAt(index).widget, index,
//                 _setting_widget.elementAt(index).title);
//           },
//         ),
//       ),
//     );
//   }

//   Widget itemListTeam(Widget doc, int indexnya, String title) {
//     return Container(
//         decoration: styleBoxUnderline(),
//         child: ExpansionTile(title: Text('${title}'), children: [
//           Column(
//             children: [doc],
//           )
//         ]));
//   }

//   @override
//   UserBloc initBloc() {
//     return KiwiContainer().resolve<UserBloc>();
//   }

//   @override
//   void initState() {
//     // _setting_widget.add(DarkModeSetting());
//     _setting_widget.add(new SettingModel("Notifikasi", NotifSetting()));
//     super.initState();
//   }

//   // List<Widget> action = [
//   //   GestureDetector(
//   //     child: Padding(
//   //       padding: const EdgeInsets.all(8.0),
//   //       child: Icon(Icons.exit_to_app),
//   //     ),
//   //     onTap: () => logout(),
//   //   ),
//   // ];

//   void logout() {
//     bloc.pushEvent(Logout());
//   }

//   @override
//   Widget mapStateHandler(UserState state) {
//     // if (state is SuccessGetDataUser) {
//     //   return Column(
//     //     children: [
//     //       HeaderUser(
//     //         user: state.user,
//     //       ),
//     //       Expanded(
//     //         child: FormUser(
//     //           user: state.user,
//     //           overtime: state.overtime,
//     //         ),
//     //       )
//     //     ],
//     //   );
//     // } else {
//     //   return Center(child: CircularProgressIndicator());
//     // }
//   }
// }
