import 'dart:async';

import 'package:ojrek_hris/core/assets/my_color.dart';
import 'package:ojrek_hris/core/assets/my_cons.dart';
import 'package:ojrek_hris/core/assets/my_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ojrek_hris/core/routing/page_routing.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  navigateDelay(String page) async {
    var _duration = new Duration(milliseconds: 2000);
    return new Timer(_duration, () {
      Get.offAllNamed(page);
    });
  }

  @override
  void initState() {
    // FCMInit fcmInit = FCMInit();
    // fcmInit.init().then((value) => navigateDelay(PageRouting.HOME));
    navigateDelay(PageRouting.WELCOME);
    initAll();
    super.initState();
  }

  Future<void> initAll() async {
    // var settingService = await SettingService.getService();
    // var data = await settingService?.get(MyCons.myUser);
    // var packageInfo = await PackageInfo.fromPlatform();
    // MyCons.appVersion = packageInfo.version;

    // if (data != null) {
    //   UserData user = UserData.fromJson(json.decode(data));
    //   MyCons.user = user;
    //   navigateDelay(PageRouting.HOME);

    //   /*  PackageInfo.fromPlatform().then((PackageInfo value) {
    //     MyCons.appVersion = value.version;
    //     navigateDelay(PageRouting.HOME);
    //   });*/
    // } else {
    //   navigateDelay(PageRouting.LOGIN);
    //   // PackageInfo.fromPlatform().then((PackageInfo value) {
    //   //   MyCons.appVersion = value.version;
    //   //   navigateDelay(PageRouting.LOGIN);
    //   // });
    // }
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    MyCons.darkModeEnabled = brightness == Brightness.dark;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor:
          MyCons.darkModeEnabled ? Colors.blueGrey : MyColors.mainColor,
      body: Container(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Icon(Icons.movie, size: MediaQuery.of(context).size.width * 60 / 100,)
                  Image(
                      image: AssetImage(MyCons.darkModeEnabled
                          ? MyImages.mainLogoDark
                          : MyImages.mainLogo),
                      width: MediaQuery.of(context).size.width * 60 / 100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
