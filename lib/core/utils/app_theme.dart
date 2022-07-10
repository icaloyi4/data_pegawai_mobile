import 'package:ojrek_hris/core/assets/my_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  //
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    bottomAppBarTheme: BottomAppBarTheme(color: Colors.white),
    backgroundColor: Colors.white,
    primaryColor: Colors.white,
    dialogBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: MyColors.mainColor,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.white,
      onPrimary: Colors.white,
      primaryVariant: Colors.white38,
      secondary: Colors.red,
    ),
    cardTheme: CardTheme(
      color: MyColors.mainColor,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    bottomAppBarTheme: BottomAppBarTheme(color: MyColors.mainColor10),
    primaryColor: Colors.black,
    backgroundColor: Colors.black,
    dialogBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      color: MyColors.mainColor10,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.dark(
      primary: MyColors.mainColor10,
      onPrimary: MyColors.mainColor10,
      primaryVariant: MyColors.mainColor10,
      secondary: Colors.red,
    ),
    cardTheme: CardTheme(
      color: MyColors.mainColor10,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  );
}
