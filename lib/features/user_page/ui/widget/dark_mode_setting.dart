// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:hris_mobile/core/assets/my_cons.dart';
// import 'package:hris_mobile/core/base/base_stateful.dart';
// import 'package:hris_mobile/core/services/setting_service.dart';
// import 'package:hris_mobile/core/utils/app_theme.dart';
// import 'package:hris_mobile/features/user_page/bloc/user_bloc.dart';
// import 'package:kiwi/kiwi.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class DarkModeSetting extends StatefulWidget {
//   @override
//   _DarkModeSetting createState() => _DarkModeSetting();
// }

// class _DarkModeSetting extends BaseState<UserBloc, UserState, DarkModeSetting> {
//   var _sortValue = 0;
//   var _themenya;
//   var _servicenya;
//   ThemeData _themeData;
//   ThemeData getTheme() => _themeData;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//       child: Column(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Text(
//                             'System Mode',
//                             style: new TextStyle(fontSize: 16.0),
//                           ),
//                         ),
//                         Radio(
//                           value: 0,
//                           groupValue: _sortValue,
//                           onChanged: (value) {
//                             _sortValue = value;
//                             _themenya = ThemeMode.system;
//                             _servicenya.set(MyCons.theme, MyCons.themeSystem);
//                             setState(() {});
//                           },
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Text(
//                             'Light Mode',
//                             style: new TextStyle(fontSize: 16.0),
//                           ),
//                         ),
//                         Radio(
//                           value: 1,
//                           groupValue: _sortValue,
//                           onChanged: (value) {
//                             _sortValue = value;
//                             _themenya = ThemeData.light();
//                             MyCons.darkModeEnabled = false;
//                             _servicenya.set(MyCons.theme, MyCons.themeLight);
//                             setState(() {});
//                           },
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Text(
//                             'Dark Mode',
//                             style: new TextStyle(fontSize: 16.0),
//                           ),
//                         ),
//                         Radio(
//                           value: 2,
//                           groupValue: _sortValue,
//                           onChanged: (value) {
//                             _sortValue = value;
//                             _themenya = ThemeData.dark();
//                             MyCons.darkModeEnabled = true;
//                             _servicenya.set(MyCons.theme, MyCons.themeDark);
//                             setState(() {});
//                           },
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   UserBloc initBloc() {
//     return KiwiContainer().resolve<UserBloc>();
//   }

//   @override
//   void initState() {
//     SharedPreferences.getInstance().then((value) {
//       _servicenya = SettingService(value);
//       var data = _servicenya.get(MyCons.theme);
//       _themenya = getTheme();
//       if (data == null || data == MyCons.themeSystem) {
//         _themenya = _sortValue = 0;
//       } else if (data == MyCons.themeLight) {
//         _sortValue = 1;
//       } else {
//         _sortValue = 2;
//       }
//       setState(() {});
//     });
//     super.initState();
//   }

//   @override
//   Widget mapStateHandler(state) {
//     // TODO: implement mapStateHandler
//     throw UnimplementedError();
//   }
// }
