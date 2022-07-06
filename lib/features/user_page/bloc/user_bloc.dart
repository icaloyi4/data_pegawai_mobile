import 'package:clean_architecture_null_safety/core/base/base_bloc.dart';
import 'package:clean_architecture_null_safety/core/base/bloc_event.dart';
import 'package:clean_architecture_null_safety/core/base/bloc_state.dart';
import 'package:clean_architecture_null_safety/features/user_page/domain/repository/user_repository.dart';
import 'package:flutter/foundation.dart';
part 'user_state.dart';
part 'user_event.dart';

class UserBloc extends BaseBloc<UserEvent, UserState> {
  final UserRepository _repos;
  bool isOnProcess = false;
  // final ProgressDialog pr = ProgressDialog(MyCons.navigatorKey.currentContext,
  //     type: ProgressDialogType.Normal, isDismissible: false);

  UserBloc(this._repos);
  @override
  void mapEventToState(UserEvent event) {
    // if (event is GetDataUser) {
    //   getDataUser(event);
    // }

    // if (event is Logout) {
    //   doingLogout();
    // }
  }

  // void getDataUser(GetDataUser event) async {
  //   if (MyCons.IS_EMPLOYEE) {
  //     await _repos.getOvertime(
  //       startDate: event.startDate,
  //       endDate: event.endDate,
  //       onSuccess: (overtime) async {
  //         await _repos.getDataUser(onSuccess: (usr.UserData values) {
  //           emitState(SuccessGetDataUser(values, overtime));
  //         }, onError: (values) {
  //           Get.offAllNamed(PageRouting.LOGIN);
  //         });
  //       },
  //       onError: (message) {
  //         Get.offAllNamed(PageRouting.LOGIN);
  //         // emitState(FailedGetOvertime());
  //       },
  //     );
  //   } else {
  //     await _repos.getDataUser(onSuccess: (usr.UserData values) {
  //       emitState(SuccessGetDataUser(values, null));
  //     }, onError: (values) {
  //       Get.offAllNamed(PageRouting.LOGIN);
  //     });
  //   }
  // }

  // static Future<void> doingLogout() async {
  //   final ProgressDialog pr = ProgressDialog(MyCons.navigatorKey.currentContext,
  //       type: ProgressDialogType.Normal, isDismissible: false);
  //   pr.style(message: "Logging off ...");
  //   pr.show();

  //   await OneSignalInit.unSubscribe(
  //     onSuccess: () async {
  //       await deleteCacheDir();
  //       await deleteAppDir();
  //       var settingService = await SettingService.getService();
  //       await settingService.del(MyCons.myUser);
  //       pr.hide();
  //       Get.offAllNamed(PageRouting.LOGIN);
  //     },
  //     onError: () {
  //       pr.hide();
  //       showSnackbar("Gagal, Silahkan Coba lagi");
  //     },
  //   );
  // }

  // static Future<void> deleteCacheDir() async {
  //   final cacheDir = await getTemporaryDirectory();

  //   if (cacheDir.existsSync()) {
  //     cacheDir.deleteSync(recursive: true);
  //   }
  // }

  // static Future<void> deleteAppDir() async {
  //   final appDir = await getApplicationSupportDirectory();

  //   if (appDir.existsSync()) {
  //     appDir.deleteSync(recursive: true);
  //   }
  // }
}
