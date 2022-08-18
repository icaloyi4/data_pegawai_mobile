import 'package:flutter/cupertino.dart';

import '../../features/login_page/data/remote/login_response.dart';

enum TypeCrud { CREATE, UPDATE, DELETE }

class MyCons {
  MyCons._();
  static String appVersion = "";
  static String myUser = "user";
  static String theme = "theme";
  static String themeSystem = "system";
  static String themeLight = "light";
  static String themeDark = "dark";
  static bool darkModeEnabled = false;
  static String employee = "EMPLOYEE";
  static String OVERTIME_ACCEPTED = "Accepted";
  static String OVERTIME_REJECTED = "Rejected";
  static String OVERTIME_CANCEL = "Canceled";
  static bool IS_EMPLOYEE = true;
  static bool IS_DEBUG = false;
  static bool isSubscribe = false;
  static String MAP_API_KEY = "AIzaSyApqRm9TawpEXnVEmMuMXi9gWvETcMh7-I";
  static String WEATHER_API_KEY = "ae450429b599f03b9e4fc827c962f110";

  static DataUser? dataUser;

  //Date Format
  static const String DATETIME_FORMAT_SERVER = "yyyy-MM-dd HH:mm:ss";
  static const String DATE_FORMAT_SERVER = "yyyy-MM-dd";
  static const String TIME_FORMAT_SERVER = "HH:mm:ss";
  static const String HOURMIN_FORMAT_SERVER = "HH:mm";
  static const String MONTHYEAR_FORMAT_BEAUTY = "MMMM, yyyy";
  static const String DATE_FORMAT_BEAUTY = "dd MMM yyyy";
  static const String DATETIME_FORMAT_BEAUTY = "dd MMM yyyy HH:mm";
}
