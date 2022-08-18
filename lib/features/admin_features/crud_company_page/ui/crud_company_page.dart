import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:kiwi/kiwi.dart';
import 'package:ojrek_hris/core/assets/my_color.dart';
import 'package:ojrek_hris/core/widget/styling.dart';
import 'package:ojrek_hris/features/admin_features/crud_company_page/bloc/crud_company_bloc.dart';
import 'package:ojrek_hris/features/login_page/data/remote/login_response.dart';

import '../../../../core/assets/my_cons.dart';
import '../../../../core/base/base_stateful.dart';
import '../../../../core/widget/cool_alert.dart';

class CrudCompanyPage extends StatefulWidget {
  @override
  _CrudCompanyPage createState() => _CrudCompanyPage();
}

class _CrudCompanyPage
    extends BaseState<CrudCompanyBloc, CrudCompanyState, CrudCompanyPage> {
  var _keyFormCompany = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.5,
        title: Text("Edit Company Info",
            style: styleHeader(
                textStyleWeight: TextStyleWeight.Title3,
                color: MyCons.darkModeEnabled ? Colors.white : Colors.black54)),
      ),
      body: Container(
          child: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
                  child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: formCompany(),
          ))),
          Card(
            child: StreamBuilder<CrudCompanyState>(
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
      )),
    );
  }

  Widget buttonSave() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          // Get.toNamed(PageRouting.REGISTER_SUCCESS);
          if (_keyFormCompany.currentState!.validate()) {
            AlertMessage.showAlert(
              context,
              message: "Are you sure?",
              title: "Confirmation",
              type: CoolAlertType.confirm,
              onConfirm: () {
                Get.back();
                bloc.pushEvent(UpdateCompany(context, _companyData));
              },
              onCancel: () {
                Get.back();
              },
            );
          }
        },
        child: Container(
          decoration: styleBoxAllWithColor(colors: MyColors.mainColor),
          child: Text(
            "Save",
            style: styleHeader(
                color: Colors.white, textStyleWeight: TextStyleWeight.Title3),
          ),
          alignment: Alignment.center,
          height: 50,
        ),
      ),
    );
  }

  Widget formCompany() {
    return Form(
      key: _keyFormCompany,
      child: Column(
        children: [
          Container(
            child: TextFormField(
              decoration: fieldDecoration('Name', Icons.business_sharp, false),
              enabled: true,
              initialValue: _companyData?.name == null
                  ? ""
                  : _companyData?.name.toString(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Name cannot be empty';
                }
                _companyData?.name = value;
                return null;
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: TextFormField(
              enabled: false,
              initialValue: _companyData?.email == null
                  ? ""
                  : _companyData?.email.toString(),
              decoration: fieldDecoration('Email', Icons.email, false),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email cannot be empty';
                }
                _companyData?.email = value;
                return null;
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: TextFormField(
              enabled: false,
              initialValue: _companyData?.phone == null
                  ? ""
                  : _companyData?.phone.toString(),
              decoration: fieldDecoration('Phone', Icons.phone, false),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Phone cannot be empty';
                }
                _companyData?.phone = value;
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
              initialValue: _companyData?.address == null
                  ? ""
                  : _companyData?.address.toString(),
              decoration:
                  fieldDecoration('Company Address', Icons.domain, false),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Company address cannot be empty';
                }
                _companyData?.address = value;
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
              initialValue: _companyData?.city == null
                  ? ""
                  : _companyData?.city.toString(),
              decoration: fieldDecoration('Company City', Icons.domain, false),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Company city cannot be empty';
                }
                _companyData?.city = value;
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
              initialValue: _companyData?.country == null
                  ? ""
                  : _companyData?.country.toString(),
              decoration:
                  fieldDecoration('Company Country', Icons.domain, false),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Company country cannot be empty';
                }
                _companyData?.country = value;
                return null;
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    enabled: true,
                    initialValue: _companyData?.location == null
                        ? ""
                        : _companyData?.location.toString(),
                    decoration: fieldDecoration(
                        'Location (Optional)', Icons.location_pin, false),
                    validator: (value) {
                      _companyData?.location =
                          value.toString().isEmpty ? null : value;
                      return null;
                    },
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlacePicker(
                            apiKey:
                                MyCons.MAP_API_KEY, // Put YOUR OWN KEY here.
                            onPlacePicked: (result) {
                              print(result);
                              Navigator.of(context).pop();
                            },
                            useCurrentLocation: true,
                            initialPosition: LatLng(6.2088, 106.8456),
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: styleBoxBorderAll(
                            backgroundColor: MyColors.mainColor,
                            withBorder: true,
                            borderColors: MyColors.mainColor),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Icon(
                            CupertinoIcons.location_solid,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ))
              ],
            ),
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

  late Company? _companyData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _companyData = MyCons.dataUser?.company;
  }

  @override
  CrudCompanyBloc initBloc() {
    // TODO: implement initBloc
    return KiwiContainer().resolve<CrudCompanyBloc>();
  }

  @override
  Widget mapStateHandler(CrudCompanyState? state) {
    if (state is LoadingState) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return buttonSave();
  }
}
