import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ojrek_hris/core/assets/my_color.dart';
import 'package:ojrek_hris/core/assets/my_cons.dart';
import 'package:ojrek_hris/core/base/base_stateful.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:ojrek_hris/core/routing/page_routing.dart';
import 'package:ojrek_hris/core/utils/utils.dart';
import 'package:ojrek_hris/core/widget/styling.dart';
import 'package:ojrek_hris/features/admin_features/crud_user_page/bloc/crud_user_bloc.dart';
import 'package:ojrek_hris/features/admin_features/crud_user_page/data/remote/get_department_position_response.dart';
import 'package:ojrek_hris/features/register_page/data/remote/register_model.dart';

class FormCrudUserPage extends StatefulWidget {
  final List<Data>? dataDept;
  FormCrudUserPage(this.dataDept);

  @override
  _FormCrudUserPage createState() => _FormCrudUserPage();
}

class _FormCrudUserPage
    extends BaseState<CrudUserBloc, CrudUserState, FormCrudUserPage> {
  var _passwordNotVisible = true;
  var _passwordController = new TextEditingController();
  var _formKey = new GlobalKey<FormState>();
  late var _deptSelectedValue;
  late var _positionSelectedValue;
  late RegisterModel _registerModel;

  var dropdownValue = "";

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
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: styleBoxAllWithColor(colors: MyColors.mainColor),
        child: Text(
          "Continue",
          style: styleHeader(
              color: Colors.white, textStyleWeight: TextStyleWeight.Title3),
        ),
        alignment: Alignment.center,
        height: 50,
      ),
    );
  }

  Widget formUser() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
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
            decoration: styleBoxAllWithColor(
                border: Border.all(color: MyColors.mainColor)),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Icon(CupertinoIcons.briefcase_fill),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10, top: 5, bottom: 5),
                      child: DropdownButton<Data>(
                        isExpanded: true,
                        value: _deptSelectedValue,
                        icon: const Icon(CupertinoIcons.chevron_down),
                        elevation: 16,
                        style: styleHeader(
                            color: Colors.black,
                            textStyleWeight: TextStyleWeight.subtitle3),
                        underline: Container(
                          height: 2,
                          color: Colors.transparent,
                        ),
                        onChanged: (value) {
                          // print(value);
                          setState(() {
                            _deptSelectedValue = value;
                            _positionSelectedValue = value?.position[0];
                          });
                        },
                        items: widget.dataDept?.map((Data map) {
                          return new DropdownMenuItem<Data>(
                              value: map, child: Text(map.name));
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: styleBoxAllWithColor(
                border: Border.all(color: MyColors.mainColor)),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Icon(CupertinoIcons.briefcase_fill),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10, top: 5, bottom: 5),
                      child: DropdownButton<Position>(
                        isExpanded: true,
                        hint: Text("Select Position"),
                        value: _positionSelectedValue,
                        icon: const Icon(CupertinoIcons.chevron_down),
                        elevation: 16,
                        style: styleHeader(
                            color: Colors.black,
                            textStyleWeight: TextStyleWeight.subtitle3),
                        underline: Container(
                          height: 2,
                          color: Colors.transparent,
                        ),
                        onChanged: (Position? newValue) {
                          setState(() {
                            _positionSelectedValue = newValue!;
                          });
                        },
                        items: _deptSelectedValue.position
                            .map<DropdownMenuItem<Position>>((Position value) {
                          return DropdownMenuItem<Position>(
                            value: value,
                            child: Text("${value.name}"),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
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
              decoration: fieldDecoration('Password', Icons.lock, false),
              controller: _passwordController,
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
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    _passwordController.text = randomPassword();
                  },
                  child: Text(
                    "Generate",
                    style:
                        styleHeader(textStyleWeight: TextStyleWeight.subtitle3),
                  ),
                ),
                Text(
                  " | ",
                  style:
                      styleHeader(textStyleWeight: TextStyleWeight.subtitle3),
                ),
                GestureDetector(
                  onTap: () {
                    Clipboard.setData(
                            ClipboardData(text: _passwordController.text))
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.grey,
                          content: Text("Password copied to clipboard")));
                    });
                  },
                  child: Text(
                    "Copy",
                    style:
                        styleHeader(textStyleWeight: TextStyleWeight.subtitle3),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          DateTimePicker(
            icon: Icon(Icons.date_range),
            cursorColor: Colors.red,
            decoration:
                fieldDecoration('Bithday (Optional)', Icons.date_range, false),
            initialValue: '',
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
            dateLabelText: 'Date',
            onChanged: (val) => print(val),
            validator: (val) {
              print(val);

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
            onChanged: (val) => print(val),
            validator: (val) {
              print(val);

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
  CrudUserBloc initBloc() {
    return KiwiContainer().resolve<CrudUserBloc>();
  }

  @override
  void initState() {
    super.initState();
    // bloc.pushEvent(GetDataLogin("-", "-"));
    _deptSelectedValue = widget.dataDept?[0];
    _positionSelectedValue = widget.dataDept?[0].position[0];
    _passwordController.text = randomPassword();
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
  Widget mapStateHandler(CrudUserState? state) {
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
