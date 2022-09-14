import 'package:date_time_picker/date_time_picker.dart';
import 'package:get/get.dart';
import 'package:ojrek_hris/core/assets/my_color.dart';
import 'package:ojrek_hris/core/assets/my_cons.dart';
import 'package:ojrek_hris/core/base/base_stateful.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:ojrek_hris/core/routing/page_routing.dart';
import 'package:ojrek_hris/core/widget/main_button.dart';
import 'package:ojrek_hris/core/widget/styling.dart';
import 'package:ojrek_hris/features/register_page/data/remote/register_model.dart';

import '../../../../core/assets/my_enum.dart';
import '../../bloc/register_bloc.dart';

class FormRegisterUserPage extends StatefulWidget {
  @override
  _FormRegisterUserPage createState() => _FormRegisterUserPage();
}

class _FormRegisterUserPage extends State<FormRegisterUserPage> {
  var _passwordNotVisible = true;
  var _formKey = new GlobalKey<FormState>();
  late RegisterModel _registerModel;

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
                      if (_formKey.currentState!.validate()) {
                        Get.toNamed(PageRouting.REGISTER_COMPANY,
                            arguments: _registerModel);
                      }
                    },
                    child: buttonLogin())))
      ],
    ));
  }

  Widget buttonLogin() {
    return MainButton(label: "Continue");
    // return Padding(
    //   padding: const EdgeInsets.all(10.0),
    //   child: Container(
    //     decoration: styleBoxAllWithColor(colors: MyColors.mainColor),
    //     child: Text(
    //       "Continue",
    //       style: styleHeader(
    //           color: Colors.white, textStyleWeight: TextStyleWeight.Title3),
    //     ),
    //     alignment: Alignment.center,
    //     height: 50,
    //   ),
    // );
  }

  Widget formUser() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            child: TextFormField(
              decoration: fieldDecoration('Name', Icons.person, false),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Name cannot be empty';
                }
                _registerModel.userName = value;
                return null;
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: TextFormField(
              decoration: fieldDecoration('Email', Icons.email, false),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email cannot be empty';
                }
                _registerModel.userEmail = value;
                return null;
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: TextFormField(
              decoration: fieldDecoration('Phone', Icons.phone, false),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Phone cannot be empty';
                }
                _registerModel.userPhone = value;
                return null;
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: TextFormField(
              decoration: fieldDecoration('Password', Icons.lock, true),
              obscureText: _passwordNotVisible,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password cannot be empty';
                }
                if (value.length <= 8) {
                  return 'Password minimal 8 character';
                }

                _registerModel.password = value;
                return null;
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: TextFormField(
              decoration: fieldDecoration('Confirm Password', Icons.lock, true),
              obscureText: _passwordNotVisible,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                }
                if (_registerModel.password != value) {
                  return 'Password not same';
                }
                _registerModel.passwordConfirmation = value;
                return null;
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // Container(
          //   child: TextFormField(
          //     decoration: fieldDecoration(
          //         'Bithday (Optional)', Icons.date_range, false),
          //   ),
          // ),
          DateTimePicker(
            icon: Icon(Icons.date_range),
            cursorColor: Colors.red,
            decoration:
                fieldDecoration('Bithday (Optional)', Icons.date_range, false),
            initialValue: '',
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
            dateLabelText: 'Date',
            onChanged: (val) {
              _registerModel.userBirthday = val;
              print(val);
            },
            validator: (val) {
              print(val);
              _registerModel.userBirthday = val;
              return null;
            },
            onSaved: (val) {
              _registerModel.userBirthday = val;
              print(val);
            },
          ),
          SizedBox(
            height: 10,
          ),
          DateTimePicker(
            icon: Icon(Icons.date_range),
            cursorColor: Colors.red,
            decoration: fieldDecoration(
                'Join Company At (Optional)', Icons.date_range, false),
            initialValue: '',
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
            dateLabelText: 'Date',
            onChanged: (val) {
              _registerModel.userJoinAt = val;
              print(val);
            },
            validator: (val) {
              print(val);
              _registerModel.userJoinAt = val;
              return null;
            },
            onSaved: (val) {
              _registerModel.userJoinAt = val;
              print(val);
            },
          ),
          SizedBox(
            height: 10,
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
  RegisterBloc initBloc() {
    return KiwiContainer().resolve<RegisterBloc>();
  }

  @override
  void initState() {
    super.initState();
    // bloc.pushEvent(GetDataLogin("-", "-"));
    _registerModel = new RegisterModel(
        userName: "",
        userEmail: "",
        password: "",
        passwordConfirmation: "",
        userPhone: "");
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
