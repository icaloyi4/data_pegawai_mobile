import 'dart:ui';

import 'package:clean_architecture_null_safety/core/assets/my_color.dart';
import 'package:clean_architecture_null_safety/core/assets/my_cons.dart';
import 'package:flutter/material.dart';

TextStyle styleHeader(double size,
    {required Color color, required FontWeight fontWeight}) {
  return TextStyle(fontWeight: fontWeight, fontSize: size, color: color);
}

BoxDecoration styleBoxUnderline({required Color color}) {
  return BoxDecoration(
      color: color,
      border: Border(bottom: BorderSide(color: Colors.black12, width: 1)));
}

BoxDecoration styleBoxCard() {
  return BoxDecoration(
      borderRadius: BorderRadius.only(
    topLeft: Radius.circular(5),
    topRight: Radius.circular(5),
  ));
}

BoxDecoration styleBoxAll() {
  return BoxDecoration(
      color: MyCons.darkModeEnabled ? Colors.transparent : Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      border: Border.all(
          width: 1,
          color: MyCons.darkModeEnabled ? MyColors.mainColor : Colors.black38));
}

InputDecoration fieldDecoration(String label,
    {required Icon icon, Color borderColor = Colors.black38}) {
  return new InputDecoration(
      enabledBorder: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(10.0),
        borderSide: BorderSide(color: borderColor),
      ),
      border: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(10.0),
        borderSide: BorderSide(color: borderColor),
      ),
      disabledBorder: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(10.0),
        borderSide: BorderSide(color: borderColor),
      ),
      focusedBorder: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(10.0),
        borderSide: BorderSide(color: borderColor),
      ),
      errorStyle: TextStyle(
        color: Colors.red, // or any other color
      ),
      labelText: label,
      prefixIcon: icon);
}

InputDecoration decorationDropdown(String label) {
  return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      labelText: label,
      labelStyle: new TextStyle(color: const Color(0xFF424242)));
}

InputDecoration decorationDropdownUnderline({String label = ""}) {
  return InputDecoration(
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: MyColors.mainColor)),
      errorBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      labelText: label);
}
