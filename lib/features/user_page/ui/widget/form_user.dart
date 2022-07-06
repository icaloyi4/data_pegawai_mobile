// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:hris_mobile/core/assets/my_color.dart';
// import 'package:hris_mobile/core/assets/my_cons.dart';
// import 'package:hris_mobile/core/utils/utils.dart';
// import 'package:hris_mobile/core/widget/line.dart';
// import 'package:hris_mobile/core/widget/styling.dart';
// import 'package:hris_mobile/features/login_page/data/remote/login_response.dart';
// import 'package:hris_mobile/features/overtime/overtime_page/data/remote/overtime_response.dart';

// class FormUser extends StatelessWidget {
//   final UserData user;
//   final List<OvertimeData> overtime;
//   BuildContext _context;

//   FormUser({this.user, this.overtime});
//   @override
//   Widget build(BuildContext context) {
//     _context = context;
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         children: [
//           (MyCons.IS_EMPLOYEE) ? userStat() : Container(),
//           SizedBox(
//             height: 10,
//           ),
//           Expanded(child: SingleChildScrollView(child: formUserDetail()))
//         ],
//       ),
//     );
//   }

//   Widget userStat() {
//     return Row(
//       children: [
//         Expanded(
//             child: Column(
//           children: [
//             Text(
//               "-",
//               overflow: TextOverflow.ellipsis,
//               style: styleHeader(20,
//                   color: MyColors.mainColor, fontWeight: FontWeight.normal),
//             ),
//             Text(
//               "Available Leave",
//               overflow: TextOverflow.ellipsis,
//               style: styleHeader(15,
//                   color: MyColors.mainColor, fontWeight: FontWeight.normal),
//             )
//           ],
//         )),
//         line(1.0, 35.0, MyColors.bottomIconInActiveColor),
//         Expanded(
//             child: Column(
//           children: [
//             Text(
//               "${overtime != null ? overtime.length : "-"}",
//               overflow: TextOverflow.ellipsis,
//               style: styleHeader(20,
//                   color: MyColors.mainColor, fontWeight: FontWeight.normal),
//             ),
//             Text(
//               "Total Overtime",
//               overflow: TextOverflow.ellipsis,
//               style: styleHeader(15,
//                   color: MyColors.mainColor, fontWeight: FontWeight.normal),
//             )
//           ],
//         )),
//         line(1.0, 35.0, MyColors.bottomIconInActiveColor),
//         Expanded(
//             child: Column(
//           children: [
//             Text(
//               "-",
//               overflow: TextOverflow.ellipsis,
//               style: styleHeader(20,
//                   color: MyColors.mainColor, fontWeight: FontWeight.normal),
//             ),
//             Text(
//               "Total Training",
//               overflow: TextOverflow.ellipsis,
//               style: styleHeader(15,
//                   color: MyColors.mainColor, fontWeight: FontWeight.normal),
//             )
//           ],
//         )),
//       ],
//     );
//   }

//   Widget formUserDetail() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         user.isContract != null
//             ? !user.isContract
//                 ? Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                         child: Text(
//                       "Pegawai sedang dalam masa peralihan kontrak, kemungkinanan ada beberapa data yang hilang",
//                       style: styleHeader(15,
//                           fontWeight: FontWeight.bold, color: Colors.red),
//                     )),
//                   )
//                 : Container()
//             : Container(),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//               decoration: styleBoxUnderline(),
//               child: dataUser("Costumer", user.customerName)),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//               decoration: styleBoxUnderline(),
//               child: dataUser("Company", user.company)),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//               decoration: styleBoxUnderline(),
//               child: dataUser("Manager", user.managerFullName)),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//               decoration: styleBoxUnderline(),
//               child: dataUser("Division", user.division)),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//               decoration: styleBoxUnderline(),
//               child: dataUser(
//                   "Date Of Birth",
//                   changeDateFormat(
//                       date: user.dateOfBirth,
//                       format: MyCons.DATE_FORMAT_SERVER,
//                       newFormat: MyCons.DATE_FORMAT_BEAUTY))),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//               decoration: styleBoxUnderline(),
//               child: dataUser("Place Of Birth", user.placeOfBirth)),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//               decoration: styleBoxUnderline(),
//               child: dataUser("Address Street", user.addressStreet)),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//               decoration: styleBoxUnderline(),
//               child: dataUser("KTP", user.noKtp)),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//               decoration: styleBoxUnderline(),
//               child: dataUser("NPWP", user.noNpwp)),
//         ),
//         // Padding(
//         //   padding: const EdgeInsets.all(8.0),
//         //   child: Container(
//         //       decoration: styleBoxUnderline(),
//         //       child: dataUser("BPJS Kesehatan", user.)),
//         // ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//               decoration: styleBoxUnderline(),
//               child: dataUser(
//                   "BPJS Ketenagakerjaan", user.bpjsKetenagakerjaanNumber)),
//         ),

//         // Padding(
//         //   padding: const EdgeInsets.all(8.0),
//         //   child: Container(
//         //       decoration: styleBoxUnderline(),
//         //       child: dataUser("Join Date", user.)),
//         // ),
//         SizedBox(
//           height: 15,
//         ),
//       ],
//     );
//   }

//   Widget dataUser(
//     String title,
//     String isi,
//   ) {
//     return Row(
//       children: [
//         Container(
//             width: MediaQuery.of(_context).size.width * 0.3,
//             child: Text(title, overflow: TextOverflow.ellipsis)),
//         Expanded(
//           child: Text(
//             isi == null ? "-" : isi,
//             overflow: TextOverflow.ellipsis,
//             style: styleHeader(15,
//                 color: MyCons.darkModeEnabled ? Colors.white54 : Colors.black45,
//                 fontWeight: FontWeight.normal),
//             textAlign: TextAlign.right,
//           ),
//         )
//       ],
//     );
//   }
// }
