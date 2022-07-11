import 'package:get/get.dart';
import 'package:ojrek_hris/core/assets/my_color.dart';
import 'package:ojrek_hris/core/assets/my_cons.dart';
import 'package:ojrek_hris/core/base/base_stateful.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:ojrek_hris/core/routing/page_routing.dart';
import 'package:ojrek_hris/core/widget/styling.dart';

import '../../bloc/register_bloc.dart';

class FormRegisterUserPage extends StatefulWidget {
  @override
  _FormRegisterUserPage createState() => _FormRegisterUserPage();
}

class _FormRegisterUserPage
    extends BaseState<RegisterBloc, RegisterState, FormRegisterUserPage> {
  var _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Expanded(
            child: SingleChildScrollView(
                child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: formUser(),
        ))),
        Card(
            child: Container(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                    onTap: () {
                      Get.toNamed(PageRouting.REGISTER_COMPANY);
                    },
                    child: buttonLogin())))
      ],
    ));
  }

  Widget buttonLogin() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: styleBoxAllWithColor(colors: MyColors.mainColor),
        child: Text(
          "Continue",
          style:
              styleHeader(20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        alignment: Alignment.center,
        height: 50,
      ),
    );
  }

  Widget formUser() {
    return Column(
      children: [
        Container(
          child: TextFormField(
            decoration: fieldDecoration('Name', Icons.person, false),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: TextFormField(
            decoration: fieldDecoration('Email', Icons.email, false),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: TextFormField(
            decoration: fieldDecoration('Phone', Icons.phone, false),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: TextFormField(
            decoration: fieldDecoration('Password', Icons.lock, true),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: TextFormField(
            decoration: fieldDecoration('Confirm Password', Icons.lock, true),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: TextFormField(
            decoration:
                fieldDecoration('Bithday (Optional)', Icons.date_range, false),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: TextFormField(
            decoration: fieldDecoration(
                'Join Company At (Optional)', Icons.date_range, false),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  InputDecoration fieldDecoration(
      String label, IconData icon, bool isPassword) {
    return new InputDecoration(
      hintText: label,
      // labelText: label,
      labelStyle: new TextStyle(color: MyColors.mainColor),
      prefixIcon: Icon(
        icon,
        color: MyColors.mainColor,
      ),
      suffixIcon: isPassword
          ? IconButton(
              icon: Icon(
                  // Based on passwordVisible state choose the icon
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: MyCons.darkModeEnabled
                      ? Colors.white
                      : MyColors.mainColor),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            )
          : null,
      enabledBorder: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(10.0),
        borderSide: BorderSide(color: MyColors.mainColor),
      ),
      border: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(10.0),
        borderSide: BorderSide(color: MyColors.mainColor),
      ),
      disabledBorder: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(10.0),
        borderSide: BorderSide(color: MyColors.mainColor),
      ),
      focusedBorder: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(10.0),
        borderSide: BorderSide(color: MyColors.mainColor),
      ),
      errorStyle: TextStyle(
        color: Colors.red, // or any other color
      ),
    );
  }

  @override
  RegisterBloc initBloc() {
    return KiwiContainer().resolve<RegisterBloc>();
  }

  @override
  void initState() {
    super.initState();
    // bloc.pushEvent(GetDataLogin("-", "-"));
  }

  // List<Widget> action = [
  //   GestureDetector(
  //     child: Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Icon(Icons.exit_to_app),
  //     ),
  //     onTap: () => logout(),
  //   ),
  // ];

  // void logout() {
  //   bloc.pushEvent(Logout());
  // }

  @override
  Widget mapStateHandler(RegisterState? state) {
    // if (state is SuccessGetDataUser) {
    //   return Column(
    //     children: [
    //       HeaderUser(
    //         user: state.user,
    //       ),
    //       Expanded(
    //         child: FormUser(
    //           user: state.user,
    //           overtime: state.overtime,
    //         ),
    //       )
    //     ],
    //   );
    // } else {
    //   return Center(child: CircularProgressIndicator());
    // }
    return Container();
  }
}
