import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ojrek_hris/core/assets/my_color.dart';
import '../../../core/widget/styling.dart';
import '../bloc/register_bloc.dart';
import 'widget/form_register_user.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: body(),
        ),
        Expanded(child: FormRegisterUserPage())
      ],
    )));
  }

  Widget body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome to ojrek,",
          style: styleHeader(
              color: MyColors.mainColor,
              textStyleWeight: TextStyleWeight.Title),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Before that. \nPlease introduce yourself first.",
          style: styleHeader(
              color: Colors.black45,
              textStyleWeight: TextStyleWeight.subtitle2),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
