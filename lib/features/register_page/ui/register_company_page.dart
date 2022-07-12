import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ojrek_hris/core/assets/my_color.dart';
import '../../../core/widget/styling.dart';
import '../bloc/register_bloc.dart';
import 'widget/form_register_company.dart';

class RegisterCompanyPage extends StatefulWidget {
  @override
  _RegisterCompanyPage createState() => _RegisterCompanyPage();
}

class _RegisterCompanyPage extends State<RegisterCompanyPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          Expanded(child: FormRegisterCompanyPage())
        ],
      ))),
    );
  }

  Widget body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Last Step,",
          style: styleHeader(
              color: MyColors.mainColor,
              textStyleWeight: TextStyleWeight.Title),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Please introduce yout company.",
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
