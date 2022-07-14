import 'package:flutter/material.dart';

class CardMenuModel {
  final String title;
  final String routing;
  final IconData icon;
  final List<dynamic>? argument;

  CardMenuModel(this.title, this.routing, this.icon, this.argument);
}
