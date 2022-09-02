import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/kiwi.dart';
import 'package:ojrek_hris/core/assets/my_color.dart';
import 'package:ojrek_hris/core/base/base_stateful.dart';
import 'package:ojrek_hris/core/routing/page_routing.dart';
import 'package:ojrek_hris/core/utils/utils.dart';
import 'package:ojrek_hris/features/user_page/bloc/user_bloc.dart';
import 'package:ojrek_hris/core/remote/adapter_html.dart'
    if (dart.library.io) 'package:ojrek_hris/core/remote/adapter_io.dart'
    as html;
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/assets/my_cons.dart';
import '../../../../core/assets/my_enum.dart';
import '../../../../core/widget/styling.dart';

class ListMenu extends StatefulWidget {
  @override
  _ListMenu createState() => _ListMenu();
}

class _ListMenu extends BaseState<UserBloc, UserState, ListMenu> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // menu(CupertinoIcons.person, "Company Profile"),
          Container(
            color: MyCons.darkModeEnabled ? Colors.blueGrey[200] : Colors.white,
            child: ExpansionTile(
              textColor: MyCons.darkModeEnabled ? Colors.blueGrey[600] : null,
              title: textWithIcon(
                  icon: CupertinoIcons.building_2_fill,
                  iconCustomColor: MyCons.darkModeEnabled
                      ? Colors.blueGrey
                      : MyColors.mainColor,
                  text: "Company Profile"),
              children: [
                listItem(
                    "Company", cekNullorEmpty(MyCons.dataUser?.company?.name)),
                listItem(
                    "Phone", cekNullorEmpty(MyCons.dataUser?.company?.phone)),
                listItem(
                    "Email", cekNullorEmpty(MyCons.dataUser?.company?.email)),
                listItem("Address",
                    cekNullorEmpty(MyCons.dataUser?.company?.address)),
                listItem(
                    "City", cekNullorEmpty(MyCons.dataUser?.company?.city)),
                listItem("Location",
                    cekNullorEmpty(MyCons.dataUser?.company?.location)),
                listItem("Department",
                    cekNullorEmpty(MyCons.dataUser?.department?.name)),
                // (MyCons.dataUser?.department?.name != null)
                //     ? listItem("Department", MyCons.dataUser?.department?.name)
                //     : Container(),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: MyCons.darkModeEnabled ? Colors.blueGrey[200] : Colors.white,
            child: ExpansionTile(
              textColor: MyCons.darkModeEnabled ? Colors.blueGrey[600] : null,
              title: textWithIcon(
                  icon: CupertinoIcons.person_alt,
                  iconCustomColor: MyCons.darkModeEnabled
                      ? Colors.blueGrey
                      : MyColors.mainColor,
                  text: "User Profile"),
              children: [
                listItem("NIK", cekNullorEmpty(MyCons.dataUser?.user?.nIK)),
                listItem("Phone", cekNullorEmpty(MyCons.dataUser?.user?.phone)),
                listItem("Email", cekNullorEmpty(MyCons.dataUser?.user?.email)),
                listItem(
                    "Address", cekNullorEmpty(MyCons.dataUser?.user?.address)),
                listItem("Birthday",
                    cekNullorEmpty(MyCons.dataUser?.user?.birthday)),
                listItem(
                    "Join At", cekNullorEmpty(MyCons.dataUser?.user?.joinAt)),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              color: MyCons.darkModeEnabled ? Colors.grey[200] : Colors.white,
              child: Column(
                children: [
                  Container(
                    decoration: styleBoxUnderline(
                        color: MyCons.darkModeEnabled
                            ? Colors.blueGrey[200]
                            : null),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: textWithIcon(
                          icon: CupertinoIcons.question_circle_fill,
                          iconCustomColor: MyCons.darkModeEnabled
                              ? Colors.blueGrey
                              : MyColors.mainColor,
                          text: "Frequently Ask & Questions"),
                    ),
                  ),
                  Container(
                    decoration: styleBoxUnderline(
                        color: MyCons.darkModeEnabled
                            ? Colors.blueGrey[200]
                            : null),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: textWithIcon(
                          icon: CupertinoIcons.refresh_circled_solid,
                          iconCustomColor: MyCons.darkModeEnabled
                              ? Colors.blueGrey
                              : MyColors.mainColor,
                          text: "Reset Password"),
                    ),
                  ),
                  Container(
                    decoration: styleBoxUnderline(
                        color: MyCons.darkModeEnabled
                            ? Colors.blueGrey[200]
                            : null),
                    child: GestureDetector(
                        onTap: () {
                          bloc.pushEvent(Logout(context));
                          // Get.offAllNamed(PageRouting.LOGIN);
                        },
                        child: StreamBuilder<UserState>(
                            stream: bloc.stateStream,
                            initialData: InitState(),
                            builder: (blocCtx, snapshot) =>
                                mapStateHandler(snapshot.data))),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget menu(IconData icon, String title) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: MyCons.darkModeEnabled ? Colors.blueGrey : MyColors.mainColor,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: Text(
          title,
          style: styleHeader(textStyleWeight: TextStyleWeight.body),
        ))
      ],
    );
  }

  Widget listItem(String? title, String? subtitle) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: styleBoxUnderline(color: Colors.transparent),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Text(
                  "$title",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: (title.toString().toLowerCase() == "location")
                      ? GestureDetector(
                          onTap: () async {
                            if (MyCons.isWeb) {
                              // html.window.open(
                              //     'https://maps.google.com/?q=${subtitle}',
                              //     'new tab');
                              // html.HtmlAdapter.openBrowser(
                              //     'https://maps.google.com/?q=${subtitle}',
                              //     'new tab');
                              if (!await launchUrl(Uri.parse(
                                  'https://maps.google.com/?q=${subtitle}'))) {
                                throw 'Could not launch https://maps.google.com/?q=${subtitle}';
                              }
                            } else {
                              Get.toNamed(PageRouting.MAP_PICKER,
                                  arguments: [subtitle, TypeMap.MAP_OPEN]);
                            }
                          },
                          child: Text(
                            "Open Location",
                            style: styleHeader(
                                textStyleWeight: TextStyleWeight.body,
                                color: Colors.blue),
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      : Text(
                          "$subtitle",
                          style: styleHeader(
                              textStyleWeight: TextStyleWeight.body),
                          overflow: TextOverflow.ellipsis,
                        ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  UserBloc initBloc() {
    return KiwiContainer().resolve<UserBloc>();
  }

  @override
  Widget mapStateHandler(UserState? state) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: textWithIcon(
            icon: CupertinoIcons.square_arrow_left_fill,
            iconCustomColor:
                MyCons.darkModeEnabled ? Colors.blueGrey : MyColors.mainColor,
            text: "Sign Out",
            textStyle: styleHeader(color: Colors.red)));
  }
}
