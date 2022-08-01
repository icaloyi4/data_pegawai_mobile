import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:ojrek_hris/core/assets/my_color.dart';
import 'package:ojrek_hris/core/assets/my_cons.dart';
import 'package:flutter/material.dart';

enum TextStyleWeight {
  Title,
  Title2,
  Title3,
  subtitle1,
  subtitle2,
  subtitle3,
  body,
}

TextStyle styleHeader(
    {Color? color, TextStyleWeight textStyleWeight = TextStyleWeight.body}) {
  switch (textStyleWeight) {
    case TextStyleWeight.Title:
      return TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: color);
    case TextStyleWeight.Title2:
      return TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: color);
    case TextStyleWeight.Title3:
      return TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: color);
    case TextStyleWeight.subtitle1:
      return TextStyle(fontSize: 25, color: color);
    case TextStyleWeight.subtitle2:
      return TextStyle(fontSize: 20, color: color);
    case TextStyleWeight.subtitle3:
      return TextStyle(fontSize: 15, color: color);
    case TextStyleWeight.body:
      return TextStyle(color: color);
  }
}

BoxDecoration styleBoxUnderline({Color? color = Colors.white}) {
  return BoxDecoration(
      color: color,
      border: Border(bottom: BorderSide(color: Colors.black12, width: 1)));
}

BoxDecoration styleBoxCard({Color color = Colors.white}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ));
}

BoxDecoration styleBoxAll({bool withBorder = false}) {
  return BoxDecoration(
      color: MyCons.darkModeEnabled ? Colors.transparent : Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(15)),
      border: withBorder
          ? Border.all(
              width: 1,
              color:
                  MyCons.darkModeEnabled ? MyColors.mainColor : Colors.black38)
          : null);
}

BoxDecoration styleBoxAllWithColor(
    {Color colors = Colors.transparent, BoxBorder? border}) {
  return BoxDecoration(
      color: colors,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      border: border,);
}

InputDecoration fieldDecoration(String label,
    {required IconData icon, Color borderColor = Colors.black38}) {
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
      prefixIcon: Icon(icon));
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

Widget textWithIcon(
    {required IconData icon,
    required String text,
    Color? iconCustomColor,
    TextStyle? textStyle}) {
  return Row(
    children: [
      Icon(
        icon,
        color: iconCustomColor,
      ),
      SizedBox(
        width: 10,
      ),
      Expanded(
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: textStyle,
        ),
      ),
    ],
  );
}
