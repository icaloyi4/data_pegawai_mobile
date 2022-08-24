import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:ojrek_hris/core/assets/my_color.dart';

class AlertMessage {
  static void showAlert(BuildContext context,
      {required String message, String? title, required CoolAlertType type, Function()? onConfirm, Function()? onCancel, String confirmTxt = "Ok", String cancelTxt = "Cancel", Color confirmBtnColor = MyColors.mainColor}) {
    CoolAlert.show(
      context: context,
      type: type,
      title: title,
      text: message,
      onConfirmBtnTap: onConfirm,
      onCancelBtnTap: onCancel,
      confirmBtnText: confirmTxt,
      cancelBtnText: cancelTxt,
      confirmBtnColor: confirmBtnColor
    );
  }
}
