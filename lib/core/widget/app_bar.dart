// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// Widget myAppBarxLogo(String title, List<Widget> action,
//     {String imagepath = MyImages.mainLogo2}) {
//   return AppBar(
//     actions: action,
//     backgroundColor:
//         MyCons.darkModeEnabled ? MyColors.mainColor10 : MyColors.mainColor,
//     title: Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         children: [
//           imagepath == null ? Container() : Image.asset(imagepath, height: 40),
//           Expanded(child: Center(child: Text(title)))
//         ],
//       ),
//     ),
//   );
// }

// Widget myAppBar(String title, List<Widget> action, BuildContext context,
//     [Color color = MyColors.mainColor, Color titleColor = Colors.white]) {
//   return AppBar(
//     actions: action,
//     backgroundColor: Theme.of(context).brightness.index == 0
//         ? MyColors.mainColor10
//         : MyColors.mainColor,
//     title: Text(
//       title,
//       style: TextStyle(color: titleColor),
//     ),
//   );
// }
