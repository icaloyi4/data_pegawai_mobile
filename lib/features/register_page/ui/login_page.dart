import 'package:ojrek_hris/core/assets/my_color.dart';
import 'package:ojrek_hris/core/assets/my_cons.dart';
import 'package:ojrek_hris/core/base/base_stateful.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:ojrek_hris/features/register_page/ui/widget/form_register.dart';

import '../../../core/widget/styling.dart';
import '../bloc/register_bloc.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            Expanded(child: FormRegisterPage())
          ],
        ),
      ))),
    );
  }

  Widget body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Let's Sign You In",
          style: styleHeader(30,
              color: MyColors.mainColor, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Welcome Back. \nLets start working.",
          style: styleHeader(20,
              color: Colors.black45, fontWeight: FontWeight.normal),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
