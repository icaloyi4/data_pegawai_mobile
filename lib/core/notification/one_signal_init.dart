// import 'dart:convert';

// import 'package:hris_mobile/core/assets/my_cons.dart';
// import 'package:hris_mobile/core/config/flavor_config.dart';
// import 'package:hris_mobile/core/database/database_module.dart';
// import 'package:hris_mobile/core/database/hris_dao.dart';
// import 'package:hris_mobile/core/services/setting_service.dart';
// import 'package:hris_mobile/core/utils/utils.dart';
// import 'package:hris_mobile/features/home_page/bloc/home_bloc.dart';
// import 'package:hris_mobile/features/login_page/data/remote/login_response.dart';
// import 'package:intl/intl.dart';
// import 'package:onesignal_flutter/onesignal_flutter.dart';

// class OneSignalInit {
//   final HrisDao hrisDao;
//   final HomeBloc homeBloc;

//   static const OS_APP_ID_DEV = "ae4b0860-7d0e-45ed-808e-7d3343cd236e";
//   static const OS_APP_ID_PROD = "cea7c771-8079-4829-8bfa-5f45861ba728";

//   OneSignalInit(this.hrisDao, this.homeBloc);

//   Future<void> init() async {
//     //Remove this method to stop OneSignal Debugging
//     OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

//     OneSignal.shared.setAppId(
//         "${FlavorConfig.isProduction() ? OS_APP_ID_PROD : OS_APP_ID_DEV}");
//     //OneSignal.shared.setAppId("$OS_APP_ID_PROD");

// // The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
// //     OneSignal.shared
// //         .promptUserForPushNotificationPermission()
// //         .then((accepted) async {
// //       print("Accepted permission: $accepted");
// //       Map<String, dynamic> tags = {
// //         "id": MyCons.user.employeeId,
// //         "authorities": MyCons.user.authorities
// //       };
// //       await OneSignal.shared.sendTags(tags);
// //       showSnackbar("Behasil Subscribe");
// //     });

//     OneSignal.shared.setNotificationWillShowInForegroundHandler(
//         (OSNotificationReceivedEvent event) {
//       // Will be called whenever a notification is received in foreground
//       // Display Notification, pass null param for not displaying the notification
//       event.complete(event.notification);
//       Map<String, dynamic> data;
//       // NotifEntitie notifEntiti = NotifEntitie(
//       //   id: int.parse(data['id']),
//       //   id_content: int.parse(data['id_content']),
//       //   id_user: user.employeeId,
//       //   content: data['content'],
//       //   route: data['route'],
//       //   title: data['title'],
//       //   created_at: data['created_at'],
//       //   isRead: false);
//       data = {
//         "id": event.notification.notificationId,
//         "id_content": event.notification.additionalData["id"],
//         "content": event.notification.body,
//         "title": event.notification.title,
//         "route": event.notification.additionalData["route"],
//         "created_at":
//             (new DateFormat('dd-MMMM-yyyy HH:mm').format(new DateTime.now()))
//                 .toString()
//       };
//       // LocalNotification.showNotificationOS(data);
//       saveNotification(data).then(
//           (value) => print("Sukses ${event.notification.additionalData}"));
//       print(
//           "[OS] ShowInForegroundHandler : Will be called whenever a notification is received in foreground");
//     });

//     OneSignal.shared
//         .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
//       // Will be called whenever a notification is opened/button pressed.
//       if (result.notification.additionalData["action"]
//               .toString()
//               .toLowerCase() ==
//           "open") {
//         if (result.notification.additionalData["route"].toString().isNotEmpty) {
//           updateNotificatons(result.notification.additionalData);
//           // MyCons.notif_route = {"route" : result.notification.additionalData["route"].toString(), "id" : result.notification.additionalData["id"].toString()};

//           // Navigator.of(MyCons.navigatorKey.currentContext).pushNamed(
//           //     '${result.notification.additionalData["route"]}',
//           //     arguments: [
//           //       null,
//           //       null,
//           //       null,
//           //       null,
//           //       result.notification.additionalData["id"].toString()
//           //     ]);
//           // print(ModalRoute.of(MyCons.navigatorKey.currentContext)
//           //     .settings
//           //     .name
//           //     .toString());
//           try {
//             MyCons.navigatorKey.currentState.pushNamed(
//                 "/${result.notification.additionalData["route"]}",
//                 arguments: [
//                   null,
//                   null,
//                   null,
//                   null,
//                   result.notification.additionalData["id"].toString()
//                 ]);
//           } on Exception catch (e) {
//             print(e);
//           }

//           // Get.toNamed("${result.notification.additionalData["route"]}",
//           //     arguments: [
//           //       null,
//           //       null,
//           //       null,
//           //       null,
//           //       result.notification.additionalData["id"].toString()
//           //     ]);
//         }
//       }
//       print(
//           "[OS] OpenedHandler : Will be called whenever a notification is opened/button pressed.");
//     });

//     OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
//       // Will be called whenever the permission changes
//       // (ie. user taps Allow on the permission prompt in iOS)
//       print(
//           "[OS] PermissionObserver : Will be called whenever the permission changes");
//     });

//     OneSignal.shared
//         .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
//       // Will be called whenever the subscription changes
//       // (ie. user gets registered with OneSignal and gets a user ID)
//       print(
//           "[OS] PermissionObserver : Will be called whenever the subscription changes");
//     });

//     OneSignal.shared.setEmailSubscriptionObserver(
//         (OSEmailSubscriptionStateChanges emailChanges) {
//       // Will be called whenever then user's email subscription changes
//       // (ie. OneSignal.setEmail(email) is called and the user gets registered
//       print(
//           "[OS] PermissionObserver : Will be called whenever then user's email subscription changess");
//     });

//     OneSignal.shared.promptUserForPushNotificationPermission();

// // If you want to know if the user allowed/denied permission,
// // the function returns a Future<bool>:
//     await OneSignal.shared.promptUserForPushNotificationPermission();
//     Map<String, dynamic> tags = {
//       "id": MyCons.user.employeeId,
//       "authorities": MyCons.user.authorities
//     };
//     OneSignal.shared.sendTags(tags).then((value) {
//       MyCons.isSubscribe = true;
//       if (MyCons.IS_DEBUG)
//         showSnackbar("Behasil Subscribe", typeSnakcbar: TypeSnacbar.INFO);
//     }).onError((error, stackTrace) {
//       if (MyCons.IS_DEBUG)
//         showSnackbar(error.toString(), typeSnakcbar: TypeSnacbar.ERROR);
//       else
//         showSnackbar("Gagal Subscribe Notifikasi",
//             typeSnakcbar: TypeSnacbar.ERROR);
//     });
//   }

//   static Future<void> unSubscribe(
//       {Function() onSuccess, Function() onError}) async {
//     OneSignal.shared.setAppId(
//         "${FlavorConfig.isProduction() ? OS_APP_ID_PROD : OS_APP_ID_DEV}");
//     //OneSignal.shared.setAppId("$OS_APP_ID_PROD");
//     try {
//       List<String> tagKeys = ["id", "authorities"];
//       await OneSignal.shared.deleteTags(tagKeys);
//       onSuccess();
//     } on Exception catch (e) {
//       print(e);
//       onError();
//     }
//   }

//   Future<void> saveNotification(Map<String, dynamic> data) async {
//     SettingService _settingService;
//     _settingService = await SettingService.getService();
//     var dataUser = await _settingService.get(MyCons.myUser);
//     UserData user = UserData.fromJson(json.decode(dataUser));

//     // Map<String, dynamic> myMap = new Map<String, dynamic>.from(message);
//     // final dynamic data = new Map<String, dynamic>.from(message);
//     NotifEntitie notifEntiti = NotifEntitie(
//         id: data['id'],
//         id_content: data['id_content'],
//         id_user: user.employeeId.toString(),
//         content: data['content'],
//         route: data['route'],
//         title: data['title'],
//         created_at: DateTime.now(),
//         isRead: false);
//     try {
//       await hrisDao.insertNotif(notifEntiti);
//       if (homeBloc != null) {
//         homeBloc.pushEvent(CountNotification());
//       }
//     } on Exception catch (e) {
//       // TODO
//     }
//   }

//   Future<void> updateNotificatons(Map<String, dynamic> data) async {
//     try {
//       SettingService _settingService;
//       _settingService = await SettingService.getService();
//       var dataUser = await _settingService.get(MyCons.myUser);
//       UserData user = UserData.fromJson(json.decode(dataUser));
//       await hrisDao.updateNotifById(user.employeeId, data['id']);
//       if (homeBloc != null) {
//         homeBloc.pushEvent(CountNotification());
//       }
//     } on Exception catch (e) {
//       // TODO
//     }
//   }
// }
