// import 'dart:convert';
// import 'dart:io';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:hris_mobile/core/assets/my_cons.dart';
// import 'package:hris_mobile/core/database/database_module.dart';
// import 'package:hris_mobile/core/database/hris_dao.dart';
// import 'package:hris_mobile/core/notification/local_notification.dart';
// import 'package:hris_mobile/core/services/setting_service.dart';
// import 'package:hris_mobile/features/home_page/bloc/home_bloc.dart';
// import 'package:hris_mobile/features/login_page/data/remote/login_response.dart';

// class FCMInit {
//   final firebaseMessaging = FirebaseMessaging();
//   static String token = '';
//   final localNotification = LocalNotification();
//   final HrisDao hrisDao;
//   final HomeBloc homeBloc;

//   FCMInit(this.hrisDao, this.homeBloc);

//   static Future<dynamic> onBackgroundMessage(Map<String, dynamic> message) {
//     debugPrint('onBackgroundMessage: $message');
//     if (message.containsKey('data')) {
//       String name = '';
//       String age = '';
//       if (Platform.isIOS) {
//         name = message['name'];
//         age = message['age'];
//       } else if (Platform.isAndroid) {
//         var data = message['data'];
//         name = data['name'];
//         age = data['age'];
//       }
//       // dataName = name;
//       // dataAge = age;
//       debugPrint('onBackgroundMessage: name: $name & age: $age');
//     }
//     return null;
//   }

//   Future<void> init() async {
//     firebaseMessaging.subscribeToTopic('general');
//     firebaseMessaging.configure(
//         onMessage: (Map<String, dynamic> message) async {
//           debugPrint('onMessage: $message');
//           await saveNotification(message);
//           await localNotification.notificationHandler();
//           LocalNotification.showNotification(message);
//         },
//         onBackgroundMessage: onBackgroundMessage,
//         onLaunch: (Map<String, dynamic> message) async {
//           debugPrint('onLaunch: $message');
//           await saveNotification(message);
//           await localNotification.notificationHandler();
//           LocalNotification.showNotification(message);
//         },
//         onResume: (Map<String, dynamic> message) async {
//           debugPrint('onResume: $message');
//           await saveNotification(message);
//           await localNotification.notificationHandler();
//           LocalNotification.showNotification(message);
//         });
//     firebaseMessaging.requestNotificationPermissions(
//       const IosNotificationSettings(
//           sound: true, badge: true, alert: true, provisional: true),
//     );
//     firebaseMessaging.onIosSettingsRegistered.listen((settings) {
//       debugPrint('Settings registered: $settings');
//     });
//     MyCons.tokenFCM = await firebaseMessaging.getToken();
//     debugPrint('device token:${MyCons.tokenFCM}');
//   }

//   // void getDataFcm(Map<String, dynamic> message) {
//   //   String name = '';
//   //   String age = '';
//   //   if (Platform.isIOS) {
//   //     name = message['name'];
//   //     age = message['age'];
//   //   } else if (Platform.isAndroid) {
//   //     var data = message['data'];
//   //     name = data['name'];
//   //     age = data['age'];
//   //   }
//   //   // if (name.isNotEmpty && age.isNotEmpty) {
//   //   //   setState(() {
//   //   //     dataName = name;
//   //   //     dataAge = age;
//   //   //   });
//   //   // }
//   //   debugPrint('getDataFcm: name: $name & age: $age');
//   // }

//   Future<void> saveNotification(Map<String, dynamic> message) async {
//     SettingService _settingService;
//     _settingService = await SettingService.getService();
//     var dataUser = await _settingService.get(MyCons.myUser);
//     UserData user = UserData.fromJson(json.decode(dataUser));

//     Map<String, dynamic> myMap = new Map<String, dynamic>.from(message);
//     final dynamic data = myMap['data'];
//     NotifEntitie notifEntiti = NotifEntitie(
//         // id: int.parse(data['id']),
//         // id_content: int.parse(data['id_content']),
//         // id_user: user.employeeId,
//         // content: data['content'],
//         route: data['route'],
//         title: data['title'],
//         created_at: data['created_at'],
//         isRead: false,
//         content: '',
//         id_content: '',
//         id_user: '',
//         id: '');
//     try {
//       await hrisDao.insertNotif(notifEntiti);
//       if (homeBloc != null) {
//         homeBloc.pushEvent(CountNotification());
//       }
//     } on Exception catch (e) {
//       // TODO
//     }
//   }
// }
