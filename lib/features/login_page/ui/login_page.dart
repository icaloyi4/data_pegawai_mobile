import 'package:ojrek_hris/core/assets/my_color.dart';
import 'package:ojrek_hris/core/assets/my_cons.dart';
import 'package:ojrek_hris/core/base/base_stateful.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:ojrek_hris/features/login_page/ui/widget/form_login.dart';

import '../../../core/assets/my_enum.dart';
import '../../../core/widget/styling.dart';
import '../bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          body(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.10,
          ),
          Expanded(child: FormLoginPage())
        ],
      ),
    )));
  }

  Widget body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Let's Sign You In",
          style: styleHeader(
              color: MyColors.mainColor,
              textStyleWeight: TextStyleWeight.Title),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Welcome Back. \nLets start working.",
          style: styleHeader(
              color: Colors.black45,
              textStyleWeight: TextStyleWeight.subtitle1),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
