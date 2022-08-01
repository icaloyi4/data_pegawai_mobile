import 'dart:math';

import 'package:ojrek_hris/core/assets/my_cons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

DateTime parseStringtoDate(
    {required String date, String format = MyCons.DATETIME_FORMAT_SERVER}) {
  try {
    var Datee = new DateFormat(format).parse(date);
    return Datee;
  } on Exception catch (e) {
    return DateTime.now();
  }
}

String chageDateToString(DateTime date,
    {String format = MyCons.DATETIME_FORMAT_SERVER}) {
  try {
    String formattedDate = DateFormat(format).format(date);
    return formattedDate;
  } on Exception catch (e) {
    return "";
  }
}

String changeDateFormat(
    {required String date,
    String format = MyCons.DATETIME_FORMAT_SERVER,
    String newFormat = MyCons.DATETIME_FORMAT_SERVER}) {
  try {
    DateTime oldDatetime = new DateFormat(format).parse(date);
    final DateFormat formatter = DateFormat(newFormat);
    return formatter.format(oldDatetime);
  } on Exception catch (e) {
    return "";
  }
}

enum TypeSnacbar { ERROR, INFO, WARNING }

void showSnackbar(String message,
    {TypeSnacbar typeSnakcbar = TypeSnacbar.ERROR}) {
  switch (typeSnakcbar) {
    case TypeSnacbar.ERROR:
      if (!Get.isSnackbarOpen)
        Get.snackbar("ERROR", message,
            snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.all(10.0),
            backgroundColor: Colors.red[200],
            colorText: Colors.black);
      break;
    case TypeSnacbar.INFO:
      if (!Get.isSnackbarOpen)
        Get.snackbar("INFO", message,
            snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.all(10.0),
            backgroundColor: Colors.blue[200],
            colorText: Colors.black);
      break;
    case TypeSnacbar.WARNING:
      if (!Get.isSnackbarOpen)
        Get.snackbar("WARNING", message,
            snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.all(10.0),
            backgroundColor: Colors.yellowAccent,
            colorText: Colors.black);
      break;
  }
}

Widget toast = Container(
  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(25.0),
    color: Colors.greenAccent,
  ),
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.check),
      SizedBox(
        width: 12.0,
      ),
      Text("This is a Custom Toast"),
    ],
  ),
);

String cekNullorEmpty(String? value) {
  if (value == null) {
    return "-";
  } else if (value == "") {
    return "-";
  } else {
    return value;
  }
}

Future<String> selectDate(BuildContext context,
    {String? text, String? setFirst}) async {
  DateTime now = DateTime.now();
  var first = parseStringtoDate(date: "01 01 1990", format: 'dd MM yyyy');

  if (text != null && text.isNotEmpty) {
    now = parseStringtoDate(date: text, format: 'dd MMMM yyyy');
  }
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: (setFirst != null)
          ? parseStringtoDate(date: setFirst, format: 'dd MMMM yyyy')
          : first,
      lastDate: DateTime.now());
  if (picked != null) {
    var formatter = new DateFormat('dd MMMM yyyy');
    return formatter.format(picked);
  } else {
    return (text != null) ? text : "";
  }
}

int getMaxDate(int month, int year) {
  switch (month) {
    case 1:
      return 31;
    case 2:
      if (year % 4 == 0) {
        return 29;
      } else
        return 28;
      break;
    case 3:
      return 31;
    case 4:
      return 30;
    case 5:
      return 31;
    case 6:
      return 30;
    case 7:
      return 31;
    case 8:
      return 31;
    case 9:
      return 30;
    case 10:
      return 31;
    case 11:
      return 30;
    case 12:
      return 31;
    default:
      return 30;
  }
}

String getHour() {
  var hourNow = new DateTime.now().hour;
  if (hourNow >= 4 && hourNow < 12) {
    return "Morning";
  }
  if (hourNow >= 12 && hourNow < 15) {
    return "Afternoon";
  }

  if (hourNow >= 15 && hourNow < 21) {
    return "Evening";
  }

  return "Night";
}

String messageHeader() {
  var hourNow = new DateTime.now().hour;
  if (hourNow >= 4 && hourNow < 12) {
    return "Have a Good Day";
  }
  if (hourNow >= 12 && hourNow < 15) {
    return "Don't forget to be happy";
  }

  if (hourNow >= 15 && hourNow < 21) {
    return "Let's spend the rest of the day with a smile";
  }

  return "Have a good rest, you had a wonderful day today";
}

String getInitial({String? value, required String pattern}) {
  if (value != null) {
    var splitter = value.split(pattern);
    if (splitter.length == 1) {
      return value.substring(0, 2).toUpperCase();
    } else {
      return splitter[0].toString().substring(0, 1).toUpperCase() +
          splitter[1].toString().substring(0, 1).toUpperCase();
    }
  }
  return "";
}

// String cekDayType(String date,
//     {String format = "yyyy-MM-dd", List<HolidayData> holidayData}) {
//   var now = parseStringtoDate(date: date, format: format);
//   var containsHoliday = [];
//   if (holidayData != null) {
//     holidayData.forEach((element) {
//       if (element.holidayDate == date) containsHoliday.add(element);
//     });
//   }

//   if (now.weekday > 5 || containsHoliday.isNotEmpty) {
//     return "Holiday";
//   } else {
//     return "Daily";
//   }
// }

bool cekRegexValidation(String text) {
  final alphanumeric = RegExp(r'[<>""]');
  if (alphanumeric.hasMatch(text)) {
    return true;
  }
  return false;
}

String randomPassword() {
  const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  return getRandomString(9);
}
