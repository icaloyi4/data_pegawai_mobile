import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../core/assets/my_color.dart';
import '../core/assets/my_cons.dart';
import 'admin_features/admin_home_page/ui/admin_home_page.dart';
import 'home_page/ui/home_page.dart';
import 'user_page/ui/user_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  PersistentTabController? _controller;
  @override
  void initState() {
    // TODO: implement initState
    if (MyCons.dataUser!.user!.roleId == 1)
      _controller = PersistentTabController(initialIndex: 1);
    else
      _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: myAppBar("EMPLOYEE PORTAL", action),
        // appBar: AppBar(
        //   backgroundColor: MyCons.darkModeEnabled
        //       ? MyColors.mainColor10
        //       : MyColors.mainColor,
        //   title: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Row(
        //       children: [
        //         // Image.asset(MyImages.mainLogo2, height: 40),
        //         Expanded(child: Center(child: Text("Human Capital Portal")))
        //       ],
        //     ),
        //   ),
        // ),
        body: PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: MyCons.darkModeEnabled
          ? MyColors.mainColorDark10
          : Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style9, // Choose the nav bar style with this property.
    ));
  }

  List<Widget> _buildScreens() {
    if (MyCons.dataUser!.user!.roleId == 1)
      return [AdminHomePage(), HomePage(), UserPage()];
    return [HomePage(), UserPage()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    if (MyCons.dataUser!.user!.roleId == 1) {
      return [
        PersistentBottomNavBarItem(
            icon: Icon(CupertinoIcons.group),
            title: ("Company"),
            activeColorPrimary:
                MyCons.darkModeEnabled ? Colors.white : MyColors.mainColor,
            inactiveColorPrimary: CupertinoColors.systemGrey),
        PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.home),
          title: ("Home"),
          activeColorPrimary:
              MyCons.darkModeEnabled ? Colors.white : MyColors.mainColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.person),
          title: ("Profile"),
          activeColorPrimary:
              MyCons.darkModeEnabled ? Colors.white : MyColors.mainColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
      ];
    }

    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary:
            MyCons.darkModeEnabled ? Colors.white : MyColors.mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person),
        title: ("Profile"),
        activeColorPrimary:
            MyCons.darkModeEnabled ? Colors.white : MyColors.mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      )
    ];
  }
}
