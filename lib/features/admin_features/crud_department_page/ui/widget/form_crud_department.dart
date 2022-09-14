import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ojrek_hris/core/assets/my_color.dart';
import 'package:ojrek_hris/core/base/base_stateful.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:ojrek_hris/core/widget/cool_alert.dart';
import 'package:ojrek_hris/core/widget/styling.dart';
import 'package:ojrek_hris/features/admin_features/crud_department_page/data/remote/get_department_position_response.dart';

import '../../../../../core/assets/my_enum.dart';
import '../../../../../core/widget/main_button.dart';
import '../../bloc/crud_department_bloc.dart';

class FormCrudDepartmentPage extends StatefulWidget {
  @override
  _FormCrudDepartmentPage createState() => _FormCrudDepartmentPage();
}

class _FormCrudDepartmentPage extends BaseState<CrudDepartmentBloc,
    CrudDepartmentState, FormCrudDepartmentPage> {
  var _formKey = new GlobalKey<FormState>();
  late DataDepartment _departmentInputModel;
  List<DataPosition> _listPosition = [];
  var _positionController = new TextEditingController();
  var _isUpdate = false;
  var _posValidate = false;
  int _level = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Expanded(
            child: SingleChildScrollView(
                child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: formDepartment(),
        ))),
        Card(
            child: Container(
                alignment: Alignment.bottomCenter,
                child: StreamBuilder<CrudDepartmentState>(
                    stream: bloc.stateStream,
                    initialData: InitState(),
                    builder: (blocCtx, snapshot) =>
                        mapStateHandler(snapshot.data))))
      ],
    ));
  }

  Widget buttonLogin() {
    return MainButton(
      label: "Continue",
      onTap: () {
        // Get.toNamed(PageRouting.REGISTER_SUCCESS);
          if (_formKey.currentState!.validate()) {
          // Get.back();
          AlertMessage.showAlert(
            context,
            message: "Are you sure?",
            title: "Confirmation",
            type: CoolAlertType.confirm,
            onConfirm: () {
              Get.back();
              bloc.pushEvent(RegisterDepartment(
                  context, _departmentInputModel, _isUpdate));
              // bloc.pushEvent(RegisterDepartment(
              //     context, _DepartmentInputModel, _isUpdate));
            },
            onCancel: () {
              Get.back();
            },
          );
        }
      },
    );
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
    //           bloc.pushEvent(RegisterDepartment(
    //               context, _departmentInputModel, _isUpdate));
    //           // bloc.pushEvent(RegisterDepartment(
    //           //     context, _DepartmentInputModel, _isUpdate));
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

  Widget formDepartment() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            child: TextFormField(
              initialValue: _departmentInputModel.name,
              decoration: fieldDecoration('Department Name', Icons.person),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Department Name cannot be empty';
                }
                _departmentInputModel.name = value;
                return null;
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextFormField(
                  controller: _positionController,
                  decoration: fieldDecoration(
                      'Position', Icons.business_center_rounded,
                      withCustomValidate: true),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      if (_posValidate) {
                        return 'Position cannot be empty';
                      }
                      return null;
                    }
                    // _departmentInputModel.name = value;
                    return null;
                  },
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  if (_positionController.text.isEmpty) {
                    _posValidate = true;
                  } else {
                    _listPosition.add(new DataPosition(
                        name: _positionController.text,
                        level: _level++,
                        isNew: true));
                    _positionController.clear();
                    _posValidate = false;
                  }
                  setState(() {});
                },
                child: Container(
                  decoration: styleBoxAllWithColor(colors: MyColors.mainColor),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Add",
                      style: styleHeader(
                          textStyleWeight: TextStyleWeight.body,
                          color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          (_listPosition.isNotEmpty)
              ? ReorderableListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  header: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: MyColors.mainColorDark10,
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: Text('Position',
                                      style: styleHeader(
                                          textStyleWeight:
                                              TextStyleWeight.Title3,
                                          color: Colors.white))),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  child: Text(
                                    'Level',
                                    style: styleHeader(
                                        textStyleWeight: TextStyleWeight.Title3,
                                        color: Colors.white),
                                  )),
                            ],
                          ),
                        ),
                        Text("*Drag and drop level to change position level")
                      ],
                    ),
                  ),
                  children: <Widget>[
                    for (int index = 0;
                        index < _listPosition.length;
                        index += 1)
                      Container(
                          key: Key('$index'),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 8, bottom: 8),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                    child: TextFormField(
                                  initialValue: _listPosition[index].name,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Position cannot be empty';
                                    }
                                    _listPosition[index].name = value;
                                    return null;
                                  },
                                )),
                                SizedBox(
                                  width: 40,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  child: ReorderableDragStartListener(
                                    index: index,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                          '${index + 1}',
                                          textAlign: TextAlign.center,
                                        )),
                                        Icon(CupertinoIcons.bars)
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                _listPosition[index].isNew
                                    ? GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _listPosition.removeAt(index);
                                          });
                                        },
                                        child: Icon(
                                          CupertinoIcons.xmark,
                                          color: Colors.grey,
                                          size: 18,
                                        ),
                                      )
                                    : Icon(
                                        CupertinoIcons.xmark,
                                        color: Colors.transparent,
                                        size: 18,
                                      ),
                              ],
                            ),
                          )),
                  ],
                  onReorder: (int oldIndex, int newIndex) {
                    setState(() {
                      if (oldIndex < newIndex) {
                        newIndex -= 1;
                      }
                      final DataPosition item =
                          _listPosition.removeAt(oldIndex);
                      _listPosition.insert(newIndex, item);
                    });
                  },
                )
              : Container(),
          // ReorderableList(
          //   shrinkWrap: true,
          //   itemBuilder: (ctx, index) {
          //     return Container(
          //         color: Colors.white,
          //         key: ValueKey(_listPosition[index]),
          //         child: Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: Row(
          //             children: [
          //               Expanded(
          //                   child: Text(
          //                 '${_listPosition[index].name}',
          //                 style: styleHeader(
          //                     textStyleWeight: TextStyleWeight.body),
          //               )),
          //               Text('Level ${index + 1}'),
          //             ],
          //           ),
          //         ));
          //   },
          //   itemCount: _listPosition.length,
          //   onReorder: (int oldIndex, int newIndex) {
          //     setState(() {
          //       if (oldIndex < newIndex) {
          //         newIndex -= 1;
          //       }
          //       final DataPosition item = _listPosition.removeAt(oldIndex);
          //       _listPosition.insert(newIndex, item);
          //     });
          //   },
          // )
        ],
      ),
    );
  }

  InputDecoration fieldDecoration(String label, IconData? icon,
      {bool withCustomValidate = false}) {
    return new InputDecoration(
      hintText: label,
      errorText: withCustomValidate
          ? _posValidate
              ? 'This field is required.'
              : null
          : null,
      // labelText: label,
      labelStyle: new TextStyle(color: MyColors.mainColor),
      prefixIcon: icon != null
          ? Icon(
              icon,
              color: MyColors.mainColor,
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
  CrudDepartmentBloc initBloc() {
    return KiwiContainer().resolve<CrudDepartmentBloc>();
  }

  @override
  void initState() {
    super.initState();
    // bloc.pushEvent(GetDataLogin("-", "-"));
    if (Get.arguments == null) {
      _departmentInputModel = new DataDepartment(position: _listPosition);
      // _departmentInputModel = new DataDepartmentRegister(
      //     email: '',
      //     departmentId: _deptSelectedValue.id,
      //     positionId: _positionSelectedValue.id,
      //     password: '',
      //     name: '',
      //     phone: '');
    } else {
      _isUpdate = true;
      _departmentInputModel = Get.arguments;
      _listPosition = _departmentInputModel.position;

      setState(() {});
    }
  }

  @override
  Widget mapStateHandler(CrudDepartmentState? state) {
    if (state is LoadingState) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return buttonLogin();
  }
}
