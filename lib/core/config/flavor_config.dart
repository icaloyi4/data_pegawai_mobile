import 'package:flutter/material.dart';

import '../assets/my_enum.dart';



class FlavorValues {
  FlavorValues({required this.baseUrl, required this.appVersion});

  final String baseUrl;
  final String appVersion;
}

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final Color color;
  FlavorValues? get values => _values;
  FlavorValues? _values;
  static FlavorConfig? _instance;

  factory FlavorConfig({
    required Flavor flavor,
    Color color: Colors.blue,
    required FlavorValues values,
  }) {
    _instance ??= FlavorConfig._internal(
      flavor,
      "Flavor => ${flavor.toString()}",
      color,
      values,
    );
    return _instance!;
  }

  void updateValues(FlavorValues? flavorValues) {
    _values = flavorValues!;
  }

  FlavorConfig._internal(
    this.flavor,
    this.name,
    this.color,
    FlavorValues values,
  ) {
    updateValues(values);
  }

  static FlavorConfig? get instance {
    return _instance;
  }

  static String appVer() => _instance!._values!.appVersion;

  static bool isProduction() => _instance!.flavor == Flavor.PRODUCTION;

  static bool isDevelopment() => _instance!.flavor == Flavor.DEV;

  static bool isQA() => _instance!.flavor == Flavor.STAGING;
}
