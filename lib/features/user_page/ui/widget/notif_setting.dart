// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:hris_mobile/core/assets/my_cons.dart';
// import 'package:hris_mobile/core/base/base_stateful.dart';
// import 'package:hris_mobile/core/services/setting_service.dart';
// import 'package:hris_mobile/core/utils/app_theme.dart';
// import 'package:hris_mobile/features/user_page/bloc/user_bloc.dart';
// import 'package:kiwi/kiwi.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class NotifSetting extends StatefulWidget {
//   @override
//   _NotifSetting createState() => _NotifSetting();
// }

// class _NotifSetting extends BaseState<UserBloc, UserState, NotifSetting> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//             "${MyCons.isSubscribe ? "Siap menerima notifikasi" : "Belum Subscibe"}"),
//         SizedBox(
//           height: 10,
//         ),
//         Row(
//           children: [
//             Expanded(
//                 child: Text(
//                     "${MyCons.isSubscribe ? "Siap menerima notifikasi" : "Belum Subscibe"}")),
//             btnSubscribe()
//           ],
//         )
//       ],
//     );
//   }

//   Widget btnSubscribe() {
//     return GestureDetector(
//       child: Container(
//         width: MediaQuery.of(context).size.width * 70 / 100,
//         decoration: myBoxDecoration(),
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Center(
//               child: Text(
//             'Login',
//             style: TextStyle(
//                 color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
//           )),
//         ),
//       ),
//       // onTap: () => Get.offAllNamed(PageRouting.HOME),
//       onTap: () {},
//     );
//   }

//   @override
//   UserBloc initBloc() {
//     return KiwiContainer().resolve<UserBloc>();
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget mapStateHandler(state) {
//     // TODO: implement mapStateHandler
//     throw UnimplementedError();
//   }

//   myBoxDecoration() {}
// }
