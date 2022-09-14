import 'package:cool_alert/cool_alert.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/kiwi.dart';
import 'package:ojrek_hris/core/assets/my_color.dart';
import 'package:ojrek_hris/core/widget/main_button.dart';
import 'package:ojrek_hris/core/widget/styling.dart';
import 'package:ojrek_hris/features/admin_features/crud_announcement_page/bloc/crud_announcement_bloc.dart';
import 'package:ojrek_hris/features/admin_features/crud_announcement_page/data/remote/announcement_response.dart';
import 'package:ojrek_hris/features/admin_features/crud_announcement_page/data/remote/get_department_response.dart';
import '../../../../../core/assets/my_enum.dart';
import '../../../../../core/base/base_stateful.dart';
import '../../../../../core/widget/cool_alert.dart';

class FormCrudAnnouncementPage extends StatefulWidget {
  final List<DepartmentData> dataDept;

  const FormCrudAnnouncementPage({required this.dataDept});
  @override
  _FormCrudAnnouncementPage createState() => _FormCrudAnnouncementPage();
}

class _FormCrudAnnouncementPage extends BaseState<CrudAnnouncementBloc,
    CrudAnnouncementState, FormCrudAnnouncementPage> {
  var _keyFormNews = new GlobalKey<FormState>();
  var _isUpdate = false;
  var _imageController = new TextEditingController();
  var _deptSelectedValue;
  List<DepartmentData> _dataDept = [];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Expanded(
            child: SingleChildScrollView(
                child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: formAnnouncements(),
        ))),
        Card(
          child: StreamBuilder<CrudAnnouncementState>(
              stream: bloc.stateStream,
              initialData: InitState(),
              builder: (blocCtx, snapshot) => mapStateHandler(snapshot.data)),
          // Container(
          //     alignment: Alignment.bottomCenter,
          //     child: StreamBuilder<RegisterState>(
          //         stream: bloc.stateStream,
          //         initialData: InitState(),
          //         builder: (blocCtx, snapshot) =>
          //             mapStateHandler(snapshot.data)))
        )
      ],
    ));
  }

  Widget buttonSave() {
    return MainButton(
      label: "Save",
      onTap: () {
        // Get.toNamed(PageRouting.REGISTER_SUCCESS);
        if (_keyFormNews.currentState!.validate()) {
          AlertMessage.showAlert(
            context,
            message: "Are you sure?",
            title: "Confirmation",
            type: CoolAlertType.confirm,
            onConfirm: () {
              Get.back();
              if (_announcementsData != null) {
                bloc.pushEvent(CRUDAnnouncements(context,
                    typeCrud: _isUpdate ? TypeCrud.UPDATE : TypeCrud.CREATE,
                    announcementData: _announcementsData!));
              }
            },
            onCancel: () {
              Get.back();
            },
          );
        }
      },
    );
    // return Padding(
    //   padding: const EdgeInsets.all(10.0),
    //   child: GestureDetector(
    //     onTap: () {
    //       // Get.toNamed(PageRouting.REGISTER_SUCCESS);
    //       if (_keyFormNews.currentState!.validate()) {
    //         AlertMessage.showAlert(
    //           context,
    //           message: "Are you sure?",
    //           title: "Confirmation",
    //           type: CoolAlertType.confirm,
    //           onConfirm: () {
    //             Get.back();
    //             if (_announcementsData != null) {
    //               bloc.pushEvent(CRUDAnnouncements(context,
    //                   typeCrud: _isUpdate ? TypeCrud.UPDATE : TypeCrud.CREATE,
    //                   announcementData: _announcementsData!));
    //             }
    //           },
    //           onCancel: () {
    //             Get.back();
    //           },
    //         );
    //       }
    //     },
    //     child: Container(
    //       decoration: styleBoxAllWithColor(colors: MyColors.mainColor),
    //       child: Text(
    //         "Save",
    //         style: styleHeader(
    //             color: Colors.white, textStyleWeight: TextStyleWeight.Title3),
    //       ),
    //       alignment: Alignment.center,
    //       height: 50,
    //     ),
    //   ),
    // );
  }

  Widget formAnnouncements() {
    return Form(
      key: _keyFormNews,
      child: Column(
        children: [
          Container(
            child: TextFormField(
              decoration: fieldDecoration('Title', Icons.notifications, false),
              enabled: true,
              initialValue: _announcementsData?.title == null
                  ? ""
                  : _announcementsData?.title.toString(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Title cannot be empty';
                }
                _announcementsData?.title = value;
                return null;
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: textWithIcon(icon: Icons.newspaper, text: 'Content'),
          // ),
          Container(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.notifications,
                    color: MyColors.mainColor,
                  ),
                ),
                TextFormField(
                  enabled: true,
                  maxLines: 5,
                  initialValue: _announcementsData?.subtitle == null
                      ? ""
                      : _announcementsData?.subtitle.toString(),
                  decoration: fieldDecoration(
                      'Enter announcements content here ...', null, false),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'content cannot be empty';
                    }
                    _announcementsData?.subtitle = value;
                    return null;
                  },
                ),
              ],
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
                  Icon(CupertinoIcons.briefcase_fill,
                      color: MyColors.mainColor),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10, top: 5, bottom: 5),
                      child: DropdownButton<DepartmentData>(
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
                            _announcementsData?.departmentId = value?.id;
                          });
                        },
                        items: _dataDept.map((DepartmentData map) {
                          return new DropdownMenuItem<DepartmentData>(
                              value: map, child: Text("${map.name}"));
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
          DateTimePicker(
            icon: Icon(
              Icons.date_range,
              color: MyColors.mainColor,
            ),
            cursorColor: Colors.red,
            decoration: fieldDecoration('Expired at', Icons.date_range, false),
            initialValue: _announcementsData?.expiredAt,
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
            dateLabelText: 'Date',
            onChanged: (val) {
              print(val);
              _announcementsData?.expiredAt = val;
            },
            validator: (val) {
              print(val);
              if (val!.isEmpty) {
                return "Expired date cannot be empty";
              }
              return null;
            },
            onSaved: (val) {
              _announcementsData?.expiredAt = val;
              print(val);
            },
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: TextFormField(
              initialValue: _announcementsData?.url == null
                  ? ""
                  : _announcementsData?.url.toString(),
              decoration: fieldDecoration(
                  'Announcement URL (Optional)', Icons.http, false),
              validator: (value) {
                _announcementsData?.url = value;
                return null;
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: TextFormField(
              enabled: true,
              controller: _imageController,
              decoration: fieldDecoration(
                  'Image Announcement URL (Optional)', Icons.image, false),
              onChanged: (value) {
                setState(() {});
              },
              validator: (value) {
                _announcementsData?.imgUrl = value;
                return null;
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          _imageController.text.isEmpty
              ? Container()
              : Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    _imageController.text.toString(),
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  )),
        ],
      ),
    );
  }

  InputDecoration fieldDecoration(
      String label, IconData? icon, bool isPassword) {
    return new InputDecoration(
      hintText: label,
      // labelText: label,
      labelStyle: new TextStyle(color: MyColors.mainColor),
      prefixIcon: Icon(
        icon,
        color: MyColors.mainColor,
      ),
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

  late AnnouncementsData? _announcementsData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dataDept.add(new DepartmentData(id: null, name: "All Department"));
    _dataDept.addAll(widget.dataDept);
    _isUpdate = (Get.arguments != null);
    // _newsData = MyCons.dataUser?.News;
    if (Get.arguments != null) {
      _announcementsData = Get.arguments;
      _imageController.text = _announcementsData?.imgUrl == null
          ? ""
          : _announcementsData!.imgUrl.toString();
      for (var i = 0; i < _dataDept.length; i++) {
        if (_dataDept[i].id == _announcementsData?.departmentId) {
          _deptSelectedValue = _dataDept[i].id;
          break;
        }
      }
      if (_deptSelectedValue == null) {
        _deptSelectedValue = _dataDept[0];
      }
    } else {
      _announcementsData = new AnnouncementsData();
      _deptSelectedValue = _dataDept[0];
    }
  }

  @override
  CrudAnnouncementBloc initBloc() {
    // TODO: implement initBloc
    return KiwiContainer().resolve<CrudAnnouncementBloc>();
  }

  @override
  Widget mapStateHandler(CrudAnnouncementState? state) {
    if (state is LoadingState) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return buttonSave();
  }
}
