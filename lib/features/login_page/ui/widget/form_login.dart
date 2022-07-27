import 'package:get/get.dart';
import 'package:ojrek_hris/core/assets/my_color.dart';
import 'package:ojrek_hris/core/assets/my_cons.dart';
import 'package:ojrek_hris/core/base/base_stateful.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:ojrek_hris/core/routing/page_routing.dart';
import 'package:ojrek_hris/core/widget/styling.dart';

import '../../bloc/login_bloc.dart';

class FormLoginPage extends StatefulWidget {
  @override
  _FormLoginPage createState() => _FormLoginPage();
}

class _FormLoginPage extends BaseState<LoginBloc, LoginState, FormLoginPage> {
  var _passwordNotVisible = true;
  var _emailController = new TextEditingController();
  var _passwordController = new TextEditingController();
  var _formLogin = new GlobalKey<FormState>();
  late var _mainContext;

  @override
  Widget build(BuildContext mainContext) {
    _mainContext = mainContext;
    return Container(
        child: Column(
      children: [
        formLogin(),
        Expanded(
            child: Container(
          alignment: Alignment.bottomCenter,
          child: StreamBuilder<LoginState>(
              stream: bloc.stateStream,
              initialData: InitState(),
              builder: (blocCtx, snapshot) => mapStateHandler(snapshot.data)),
        ))
      ],
    ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget buttonLogin() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: () {
          if (_formLogin.currentState != null) {
            if (_formLogin.currentState!.validate()) {
              bloc.pushEvent(LoginProcess(_emailController.text.toString(),
                  _passwordController.text.toString(), _mainContext));
            }
            // Get.offAllNamed(PageRouting.HOME);
          }
        },
        child: Container(
          decoration: styleBoxAllWithColor(colors: MyColors.mainColor),
          child: Text(
            "Login",
            style: styleHeader(
                color: Colors.white, textStyleWeight: TextStyleWeight.Title3),
          ),
          alignment: Alignment.center,
          height: 50,
        ),
      ),
    );
  }

  Widget formLogin() {
    return Form(
      key: _formLogin,
      child: Column(
        children: [
          Container(
            child: TextFormField(
              decoration: fieldDecoration('Email', Icons.email, false),
              controller: _emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Name cannot be empty';
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: TextFormField(
              obscureText: _passwordNotVisible,
              decoration: fieldDecoration('Password', Icons.lock, true),
              controller: _passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password cannot be empty';
                }
                return null;
              },
            ),
          ),
        ],
      ),
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
                  _passwordNotVisible ? Icons.visibility_off : Icons.visibility,
                  color: MyCons.darkModeEnabled
                      ? Colors.white
                      : MyColors.mainColor),
              onPressed: () {
                setState(() {
                  _passwordNotVisible = !_passwordNotVisible;
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
  LoginBloc initBloc() {
    return KiwiContainer().resolve<LoginBloc>();
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
  Widget mapStateHandler(LoginState? state) {
    if (state is LoadingState) {
      return CircularProgressIndicator(
        color: MyCons.darkModeEnabled ? Colors.white : MyColors.mainColor,
      );
      // return buttonLogin();
    }

    return buttonLogin();

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
  }
}
