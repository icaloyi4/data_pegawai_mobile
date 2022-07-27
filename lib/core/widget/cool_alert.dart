import 'dart:ffi';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

class AlertMessage {
  static void showAlert(BuildContext context,
      {required String message, String? title, required CoolAlertType type}) {
    CoolAlert.show(
      context: context,
      type: type,
      title: title,
      text: message,
    );
  }
}
