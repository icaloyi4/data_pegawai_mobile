import 'package:flutter/material.dart';

Widget line(double width, height, Color colors) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Container(
      width: width,
      height: height,
      color: colors,
    ),
  );
}
