// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
// import 'package:hris_mobile/core/utils/flutter_local_notifications_plugin_custom.dart'
//     as custom;

// final custom.FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     custom.FlutterLocalNotificationsPlugin();

// class LocalNotification {
//   static Future<void> showNotification(dynamic payload) async {
//     try {
//       Map<String, dynamic> myMap = new Map<String, dynamic>.from(payload);
//       final dynamic data = myMap['data'];
//       final dynamic notification = myMap['notification'];
//       const AndroidNotificationDetails androidPlatformChannelSpecifics =
//           AndroidNotificationDetails(
//               'BBD', 'Notification', 'All Notification is Here',
//               importance: Importance.max, priority: Priority.high);
//       final int idNotification = data['id'] != null ? int.parse(data['id']) : 1;
//       const NotificationDetails platformChannelSpecifics =
//           NotificationDetails(android: androidPlatformChannelSpecifics);
//       await flutterLocalNotificationsPlugin.show(idNotification,
//           notification['title'], notification['body'], platformChannelSpecifics,
//           payload: data['route'].toString());
//     } catch (e) {
//       print(e);
//     }
//   }

//   static Future<void> showNotificationOS(Map<String, dynamic> data) async {
//     try {
//       const AndroidNotificationDetails androidPlatformChannelSpecifics =
//           AndroidNotificationDetails(
//               'BBD', 'Notification', 'All Notification is Here',
//               importance: Importance.max, priority: Priority.high);
//       final String idNotification = data['id'] != null ? data['id'] : 1;
//       const NotificationDetails platformChannelSpecifics =
//           NotificationDetails(android: androidPlatformChannelSpecifics);
//       await flutterLocalNotificationsPlugin.show(idNotification, data['title'],
//           data['content'], platformChannelSpecifics,
//           payload: data['route'].toString());
//     } catch (e) {
//       print(e);
//     }
//   }

//   Future<void> notificationHandler() async {
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher_icon');
//     final InitializationSettings initializationSettings =
//         InitializationSettings(android: initializationSettingsAndroid);
//     flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onSelectNotification: (String payload) async {
//       if (payload != null) {
//         Get.toNamed(payload);
//       }
//     });
//   }
// }
