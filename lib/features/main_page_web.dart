import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:side_navigation/side_navigation.dart';

import '../core/assets/my_color.dart';
import '../core/assets/my_cons.dart';
import '../core/assets/my_enum.dart';
import '../core/utils/utils.dart';
import '../core/widget/styling.dart';
import 'admin_features/admin_home_page/ui/admin_home_page.dart';
import 'home_page/ui/home_page.dart';
import 'user_page/ui/user_page.dart';

class MainPageWeb extends StatefulWidget {
  @override
  _MainPageWeb createState() => _MainPageWeb();
}

class _MainPageWeb extends State<MainPageWeb> {
  var _selectedIndex = 0;
  List<Widget> _views = [];

  @override
  void initState() {
    // TODO: implement initState
    if (MyCons.dataUser!.user!.roleId == 1)
      _selectedIndex = 1;
    else
      _selectedIndex = 0;

    if (MyCons.dataUser!.user!.roleId == 1) {
      _views = [AdminHomePage(), HomePage(), UserPage()];
    } else {
      _views = [HomePage(), UserPage()];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideNavigationBar(
            selectedIndex: _selectedIndex,
            items: _navBarsItems(),
            header: SideNavigationBarHeader(
                image: Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white, // border color
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    getInitial(
                        value: MyCons.dataUser?.user?.name?.toString(),
                        pattern: " "),
                    style: styleHeader(
                        color: MyCons.darkModeEnabled
                            ? Colors.blueGrey
                            : MyColors.mainColor,
                        textStyleWeight: TextStyleWeight.Title3),
                  ),
                ),
                title: Text(
                  "${MyCons.dataUser?.user?.name?.toString()}",
                  style: styleHeader(
                      color: Colors.white,
                      textStyleWeight: TextStyleWeight.Title3),
                ),
                subtitle: Text(
                  "${(MyCons.dataUser?.position != null) ? MyCons.dataUser?.position?.name : "Not Assigned"}",
                  style: styleHeader(
                      color: Colors.white,
                      textStyleWeight: TextStyleWeight.body),
                )),
            footer: SideNavigationBarFooter(
                label: Text('© ${MyCons.dataUser?.company?.name}',
                    style: styleHeader(
                        color: Colors.white,
                        textStyleWeight: TextStyleWeight.body))),
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            toggler: SideBarToggler(
                expandIcon: Icons.keyboard_arrow_left,
                shrinkIcon: Icons.keyboard_arrow_right,
                onToggle: () {
                  print('Toggle');
                }),
          ),
          Expanded(
            child: _views.elementAt(_selectedIndex),
          )
        ],
      ),
    );
  }

  List<SideNavigationBarItem> _navBarsItems() {
    if (MyCons.dataUser!.user!.roleId == 1) {
      return [
        SideNavigationBarItem(icon: CupertinoIcons.group, label: ("Company")),
        SideNavigationBarItem(
          icon: CupertinoIcons.home,
          label: ("Home"),
        ),
        SideNavigationBarItem(icon: CupertinoIcons.person, label: ("Profile")),
      ];
    }

    return [
      SideNavigationBarItem(
        icon: CupertinoIcons.home,
        label: ("Home"),
      ),
      SideNavigationBarItem(
        icon: CupertinoIcons.person,
        label: ("Profile"),
      )
    ];
  }
}
