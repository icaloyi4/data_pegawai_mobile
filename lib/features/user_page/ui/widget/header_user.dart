// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:hris_mobile/core/assets/my_color.dart';
// import 'package:hris_mobile/core/assets/my_cons.dart';
// import 'package:hris_mobile/core/assets/my_images.dart';
// import 'package:hris_mobile/core/utils/utils.dart';
// import 'package:hris_mobile/features/login_page/data/remote/login_response.dart'
//     as usr;

// class HeaderUser extends StatelessWidget {
//   final usr.UserData user;

//   const HeaderUser({this.user});

//   TextStyle styleHeader(double i) {
//     return TextStyle(fontWeight: FontWeight.bold, fontSize: i);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: MyColors.mainColor10,
//       child: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             fotoProfil(),
//             SizedBox(
//               height: 10,
//             ),
//             Text(cekNullorEmpty(user.fullName), style: styleHeader(20)),
//             SizedBox(
//               height: 10,
//             ),
//             Text(cekNullorEmpty(user.jobTitle), style: styleHeader(17)),
//             SizedBox(
//               height: 20,
//             ),
//             Text(cekNullorEmpty(user.email)),
//             SizedBox(
//               height: 5,
//             ),
//             Text(cekNullorEmpty(user.phone)),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget fotoProfil() {
//     return Center(
//       child: Container(
//         width: 100,
//         height: 100,
//         clipBehavior: Clip.antiAlias,
//         decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color:
//                 MyCons.darkModeEnabled ? MyColors.mainColor10 : Colors.white),
//         child: Center(
//             child: Image.asset(
//           MyCons.darkModeEnabled ? MyImages.mainLogo_dark : MyImages.mainLogo,
//           color: MyColors.mainColor,
//           width: 110,
//           height: 110,
//         )),
//       ),
//     );
//   }
// }
