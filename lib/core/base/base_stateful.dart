import 'package:ojrek_hris/core/assets/my_cons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'base_bloc.dart';
import 'bloc_state.dart';

abstract class BaseState<B extends BaseBloc, BS extends BlocState,
    S extends StatefulWidget> extends State<S> {
  late B bloc;

  B initBloc();
  Widget mapStateHandler(BS? state);

  @override
  void initState() {
    bloc = initBloc();
    final window = WidgetsBinding.instance!.window;
    window.onPlatformBrightnessChanged = () {
      // This callback gets invoked every time brightness changes
      final brightness = window.platformBrightness;
      MyCons.darkModeEnabled = (brightness == Brightness.dark);
      setState(() {});
    };
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  void setLog(String message) {
    print(message);
  }

  void showToast(String message,
      {Color textColor = Colors.white,
      Color backgroundColor = Colors.black87}) {
    Fluttertoast.showToast(
        msg: message, textColor: textColor, backgroundColor: backgroundColor);
  }

  void executeUiAfterBuild(FrameCallback frameCallback) {
    WidgetsBinding.instance!.addPostFrameCallback(frameCallback);
  }
}
