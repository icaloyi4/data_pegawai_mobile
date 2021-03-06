import 'package:google_fonts/google_fonts.dart';
import 'package:ojrek_hris/core/assets/my_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  //
  final TextTheme textTheme;

  late ThemeData lightTheme;

  late ThemeData darkTheme;

  AppTheme(this.textTheme) {
    lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey[50],
      bottomAppBarTheme: BottomAppBarTheme(color: Colors.white),
      textTheme: GoogleFonts.latoTextTheme(textTheme),
      backgroundColor: Colors.white,
      primaryColor: Colors.white,
      dialogBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        iconTheme: IconThemeData(
          color: MyColors.mainColor,
        ),
      ),
      colorScheme: ColorScheme.light(
          primary: MyColors.mainColor,
          onSecondary: Colors.black,
          onPrimary: Colors.white,
          surface: Colors.black,
          onSurface: Colors.black,
          secondary: Colors.black),
      cardTheme: CardTheme(
        color: Colors.white,
      ),
      iconTheme: IconThemeData(
        color: MyColors.mainColor,
      ),
    );
    darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.blueGrey,
      bottomAppBarTheme: BottomAppBarTheme(color: MyColors.mainColorDark10),
      textTheme: GoogleFonts.robotoTextTheme(textTheme),
      primaryColor: Colors.blueGrey,
      backgroundColor: Colors.blueGrey,
      dialogBackgroundColor: Colors.blueGrey,
      appBarTheme: AppBarTheme(
        color: Colors.blueGrey[600],
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      colorScheme: ColorScheme.dark(
          primary: Colors.blueGrey,
          onSecondary: Colors.white,
          onPrimary: Colors.black,
          surface: Colors.white,
          onSurface: Colors.white,
          secondary: Colors.white),
      cardTheme: CardTheme(
        color: Colors.blueGrey[600],
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    );
  }
}
