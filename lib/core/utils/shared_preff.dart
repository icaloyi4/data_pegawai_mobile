import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreff {
  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString(key) != null) {
      return json.decode(prefs.getString(key)!);
    } else {
      return json.decode("");
    }
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
