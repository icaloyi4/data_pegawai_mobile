import 'package:cool_alert/cool_alert.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ojrek_hris/core/assets/my_color.dart';
import 'package:ojrek_hris/core/assets/my_cons.dart';
import 'package:ojrek_hris/core/base/base_stateful.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:ojrek_hris/core/utils/utils.dart';
import 'package:ojrek_hris/core/widget/cool_alert.dart';
import 'package:ojrek_hris/core/widget/main_button.dart';
import 'package:ojrek_hris/core/widget/styling.dart';
import 'package:ojrek_hris/features/admin_features/crud_user_page/bloc/crud_user_bloc.dart';

import '../../../../../core/assets/my_enum.dart';
import '../../data/remote/get_department_position_response.dart';
import '../../data/remote/get_user_response.dart';

class FormCrudUserPage extends StatefulWidget {
  final List<DataDepartment>? dataDept;
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
  late DataUserRegister _userInputModel;
  var _isUpdate = false;

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
                child: StreamBuilder<CrudUserState>(
                    stream: bloc.stateStream,
                    initialData: InitState(),
                    builder: (blocCtx, snapshot) =>
                        mapStateHandler(snapshot.data))))
      ],
    ));
  }

  Widget buttonSave() {
    return MainButton(label: "Save", onTap: (){
      if (_formKey.currentState!.validate()) {
          // Get.back();
          AlertMessage.showAlert(
            context,
            message: "Are you sure?",
            title: "Confirmation",
            type: CoolAlertType.confirm,
            onConfirm: () {
              Get.back();
              bloc.pushEvent(RegisterUser(context, _userInputModel, _isUpdate));
            },
            onCancel: () {
              Get.back();
            },
          );
        }
    },);
    // return GestureDetector(
    //   onTap: () {
    //     if (_formKey.currentState!.validate()) {
    //       // Get.back();
    //       AlertMessage.showAlert(
    //         context,
    //         message: "Are you sure?",
    //         title: "Confirmation",
    //         type: CoolAlertType.confirm,
    //         onConfirm: () {
    //           Get.back();
    //           bloc.pushEvent(RegisterUser(context, _userInputModel, _isUpdate));
    //         },
    //         onCancel: () {
    //           Get.back();
    //         },
    //       );
    //     }
    //   },
    //   child: Padding(
    //     padding: const EdgeInsets.all(10.0),
    //     child: Container(
    //       decoration: styleBoxAllWithColor(colors: MyColors.mainColor),
    //       child: Text(
    //         "Continue",
    //         style: styleHeader(
    //             color: Colors.white, textStyleWeight: TextStyleWeight.Title3),
    //       ),
    //       alignment: Alignment.center,
    //       height: 50,
    //     ),
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
              initialValue: _userInputModel.name,
              decoration: fieldDecoration('Name', Icons.person, false),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Name cannot be empty';
                }
                _userInputModel.name = value;
                return null;
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: TextFormField(
              initialValue: _userInputModel.nIK,
              decoration: fieldDecoration(
                  'Employee Identification Number (Optional)',
                  Icons.card_membership,
                  false),
              validator: (value) {
                _userInputModel.nIK = value;
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
              initialValue: _userInputModel.email,
              enabled: !_isUpdate,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email cannot be empty';
                }
                _userInputModel.email = value;
                return null;
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: TextFormField(
              decoration:
                  fieldDecoration('Address', Icons.maps_home_work, false),
              initialValue: _userInputModel.address,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              validator: (value) {
                _userInputModel.address = value;
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
                      child: DropdownButton<DataDepartment>(
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
                            _userInputModel.departmentId = value?.id;
                            _userInputModel.positionId = value?.position[0].id;
                          });
                        },
                        items: widget.dataDept?.map((DataDepartment map) {
                          return new DropdownMenuItem<DataDepartment>(
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
                      child: DropdownButton<DataPosition>(
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
                        onChanged: (DataPosition? newValue) {
                          setState(() {
                            _positionSelectedValue = newValue!;
                            _userInputModel.positionId = newValue.id;
                          });
                        },
                        items: _deptSelectedValue.position
                            .map<DropdownMenuItem<DataPosition>>(
                                (DataPosition value) {
                          return DropdownMenuItem<DataPosition>(
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
              initialValue: _userInputModel.phone,
              enabled: !_isUpdate,
              decoration: fieldDecoration('Phone', Icons.phone, false),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Phone cannot be empty';
                }
                _userInputModel.phone = value;
                return null;
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          _isUpdate
              ? Container()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      child: TextFormField(
                        decoration:
                            fieldDecoration('Password', Icons.lock, false),
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password cannot be empty';
                          }
                          if (value.length <= 8) {
                            return 'Password minimal 8 character';
                          }

                          _userInputModel.password = value;
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 8.0, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _passwordController.text = randomPassword(
                                  stringOptional: _userInputModel.name);
                            },
                            child: Text(
                              "Generate",
                              style: styleHeader(
                                  textStyleWeight: TextStyleWeight.subtitle3),
                            ),
                          ),
                          Text(
                            " | ",
                            style: styleHeader(
                                textStyleWeight: TextStyleWeight.subtitle3),
                          ),
                          GestureDetector(
                            onTap: () {
                              Clipboard.setData(ClipboardData(
                                      text: _passwordController.text))
                                  .then((_) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        backgroundColor: Colors.grey,
                                        content: Text(
                                            "Password copied to clipboard")));
                              });
                            },
                            child: Text(
                              "Copy",
                              style: styleHeader(
                                  textStyleWeight: TextStyleWeight.subtitle3),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
          DateTimePicker(
            icon: Icon(Icons.date_range),
            cursorColor: Colors.red,
            decoration:
                fieldDecoration('Bithday (Optional)', Icons.date_range, false),
            initialValue: _userInputModel.birthday,
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
            dateLabelText: 'Date',
            onChanged: (val) {
              _userInputModel.birthday = val;
              print(val);
            },
            validator: (val) {
              print(val);

              return null;
            },
            onSaved: (val) {
              _userInputModel.birthday = val;
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
            initialValue: _userInputModel.joinAt,
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
            dateLabelText: 'Date',
            onChanged: (val) {
              print(val);
              _userInputModel.joinAt = val;
            },
            validator: (val) {
              print(val);

              return null;
            },
            onSaved: (val) {
              _userInputModel.joinAt = val;
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
    if (Get.arguments == null) {
      _deptSelectedValue = widget.dataDept?[0];
      _positionSelectedValue = widget.dataDept?[0].position[0];
      _passwordController.text = randomPassword();
      _userInputModel = new DataUserRegister(
          email: '',
          departmentId: _deptSelectedValue.id,
          positionId: _positionSelectedValue.id,
          password: '',
          name: '',
          phone: '');
    } else {
      _isUpdate = true;
      _userInputModel = Get.arguments;

      if (_userInputModel.departmentId == null) {
        _deptSelectedValue = widget.dataDept?[0];
        _positionSelectedValue = widget.dataDept?[0].position[0];
        _userInputModel.departmentId = _deptSelectedValue.id;
        _userInputModel.positionId = _positionSelectedValue.id;
      } else {
        int posDept = 0;
        for (var element in widget.dataDept ?? []) {
          if (element.id == _userInputModel.departmentId) {
            _deptSelectedValue = widget.dataDept?[posDept];
            int posPosition = 0;
            for (var elementPos in widget.dataDept?[posDept].position ?? []) {
              if (elementPos.id == _userInputModel.positionId) {
                _positionSelectedValue =
                    widget.dataDept?[posDept].position[posPosition];
                break;
              } else {
                posPosition++;
              }
            }
            break;
          } else {
            posDept++;
          }
        }
      }

      setState(() {});
    }
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
    if (state is LoadingState) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return buttonSave();
  }
}
