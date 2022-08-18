import 'package:flutter/cupertino.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:ojrek_hris/core/assets/my_color.dart';
import 'package:ojrek_hris/core/assets/my_cons.dart';
import 'package:ojrek_hris/core/base/base_stateful.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:ojrek_hris/core/widget/styling.dart';
import 'package:ojrek_hris/features/register_page/data/remote/register_model.dart';
import "package:google_maps_flutter_platform_interface/src/types/location.dart";

import '../../bloc/register_bloc.dart';

class FormRegisterCompanyPage extends StatefulWidget {
  final RegisterModel registerModel;

  const FormRegisterCompanyPage({required this.registerModel});
  @override
  _FormRegisterCompanyPage createState() => _FormRegisterCompanyPage();
}

class _FormRegisterCompanyPage
    extends BaseState<RegisterBloc, RegisterState, FormRegisterCompanyPage> {
  var _passwordVisible = false;
  late RegisterModel _registerModel;
  var _keyFormCompany = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Expanded(
            child: SingleChildScrollView(
                child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: formCompany(),
        ))),
        Card(
            child: Container(
                alignment: Alignment.bottomCenter,
                child: StreamBuilder<RegisterState>(
                    stream: bloc.stateStream,
                    initialData: InitState(),
                    builder: (blocCtx, snapshot) =>
                        mapStateHandler(snapshot.data))))
      ],
    ));
  }

  Widget buttonRegister() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          // Get.toNamed(PageRouting.REGISTER_SUCCESS);
          if (_keyFormCompany.currentState!.validate()) {
            bloc.pushEvent(SignUp(_registerModel, context));
          }
        },
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Name cannot be empty';
                }
                _registerModel.companyName = value;
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email cannot be empty';
                }
                _registerModel.companyEmail = value;
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Phone cannot be empty';
                }
                _registerModel.companyPhone = value;
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
                  fieldDecoration('Company Address', Icons.domain, false),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Company address cannot be empty';
                }
                _registerModel.companyAddress = value;
                return null;
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: TextFormField(
              decoration: fieldDecoration('Company City', Icons.domain, false),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Company city cannot be empty';
                }
                _registerModel.companyCity = value;
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
                  fieldDecoration('Company Country', Icons.domain, false),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Company country cannot be empty';
                }
                _registerModel.companyCountry = value;
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
                    decoration: fieldDecoration(
                        'Location (Optional)', Icons.location_pin, false),
                    validator: (value) {
                      _registerModel.companyLocation = value;
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
                          apiKey: MyCons.MAP_API_KEY, // Put YOUR OWN KEY here.
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
                  ),
                )
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
    _registerModel = widget.registerModel;
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
    if (state is LoadingState) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
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
    return buttonRegister();
  }
}
