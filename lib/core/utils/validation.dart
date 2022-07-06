// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:get/get.dart';
// import 'package:hris_mobile/core/assets/my_color.dart';
// import 'package:hris_mobile/core/assets/my_cons.dart';
// import 'package:hris_mobile/core/routing/page_routing.dart';
// import 'package:hris_mobile/core/widget/styling.dart';
// import 'package:hris_mobile/features/overtime/overtime_page/bloc/overtime_bloc.dart';
// import 'package:hris_mobile/features/overtime/overtime_page/data/local/overtime_filter_model.dart';
// import 'package:hris_mobile/features/overtime/overtime_page/data/remote/overtime_response.dart';

// List<Widget> confirmationOvertimeWidget(
//     OvertimeBloc bloc, OvertimeFilterModel filterModel,
//     {OvertimeData manager,
//     OvertimeData requestor,
//     String salesorderid,
//     BuildContext context}) {
//   if (manager != null) {
//     if (manager.nextApproval == MyCons.user.employeeId &&
//         !manager.overtimeDetailRequestStatus.contains("Rejected") &&
//         !manager.overtimeDetailRequestStatus.contains("Canceled") &&
//         !manager.overtimeDetailRequestStatus.contains("Done")) {
//       return [
//         GestureDetector(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Icon(
//               Icons.close,
//               color: Colors.red,
//             ),
//           ),
//           onTap: () {
//             showDialog(
//                 context: context,
//                 builder: (ctxt) => showDialogRemark(
//                     ctxt,
//                     "Reject Overtime",
//                     manager.overtimeDetailId.toString(),
//                     MyCons.OVERTIME_REJECTED,
//                     bloc: bloc,
//                     salesorderid: salesorderid,
//                     isDetail: true,
//                     pageContext: context,
//                     filterModel: filterModel));
//           },
//         ),
//         GestureDetector(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Icon(
//               Icons.check,
//               color: Colors.green,
//             ),
//           ),
//           onTap: () {
//             bloc.pushEvent(GantiStatusOvertime(
//                 manager.overtimeDetailId.toString(),
//                 MyCons.OVERTIME_ACCEPTED,
//                 "-",
//                 salesorderid,
//                 true,
//                 filterModel));
//           },
//         ),
//       ];
//     } else if (MyCons.user.authorities.contains("MSFC")) {
//       if (manager.overtimeDetailRequestStatus.contains("MSFC")) {
//         return [
//           GestureDetector(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Icon(
//                 Icons.close,
//                 color: Colors.red,
//               ),
//             ),
//             onTap: () {
//               showDialog(
//                   context: context,
//                   builder: (ctxt) => showDialogRemark(
//                       ctxt,
//                       "Reject Overtime",
//                       manager.overtimeDetailId.toString(),
//                       MyCons.OVERTIME_REJECTED,
//                       bloc: bloc,
//                       salesorderid: salesorderid,
//                       isDetail: true,
//                       pageContext: context,
//                       filterModel: filterModel));
//             },
//           ),
//           GestureDetector(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Icon(
//                 Icons.check,
//                 color: Colors.green,
//               ),
//             ),
//             onTap: () {
//               bloc.pushEvent(GantiStatusOvertime(
//                   manager.overtimeDetailId.toString(),
//                   MyCons.OVERTIME_ACCEPTED,
//                   "-",
//                   salesorderid,
//                   true,
//                   filterModel));
//             },
//           ),
//         ];
//       }
//     } else {
//       if (manager.overtimeDetailRequestStatus == "Waiting For Confirmation" ||
//               (manager.overtimeDetailRequestStatus.contains("PM") &&
//                   MyCons.user.authorities.contains("PM") &&
//                   manager.overtimeDetailRequestStatus.contains("Waiting")) ||
//               (manager.overtimeDetailRequestStatus.contains("RM") &&
//                   MyCons.user.authorities.contains("RM") &&
//                   manager.overtimeDetailRequestStatus.contains("Waiting"))
//           //     ||
//           // (manager.overtimeDetailRequestStatus.contains("PM") &&
//           //     MyCons.user.authorities.contains("RM") &&
//           //     manager.overtimeDetailRequestStatus.contains("Waiting"))
//           ) {
//         return [
//           GestureDetector(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Icon(
//                 Icons.close,
//                 color: Colors.red,
//               ),
//             ),
//             onTap: () {
//               showDialog(
//                   context: context,
//                   builder: (ctxt) => showDialogRemark(
//                       ctxt,
//                       "Reject Overtime",
//                       manager.overtimeDetailId.toString(),
//                       MyCons.OVERTIME_REJECTED,
//                       bloc: bloc,
//                       salesorderid: salesorderid,
//                       isDetail: true,
//                       pageContext: context,
//                       filterModel: filterModel));
//             },
//           ),
//           GestureDetector(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Icon(
//                 Icons.check,
//                 color: Colors.green,
//               ),
//             ),
//             onTap: () {
//               bloc.pushEvent(GantiStatusOvertime(
//                   manager.overtimeDetailId.toString(),
//                   MyCons.OVERTIME_ACCEPTED,
//                   "-",
//                   salesorderid,
//                   true,
//                   filterModel));
//             },
//           ),
//         ];
//       } else
//         return [];
//     }
//   } else {
//     if (requestor.overtimeDetailRequestStatus == "Waiting For Confirmation" ||
//         (requestor.overtimeDetailRequestStatus.contains("PM") &&
//             requestor.overtimeDetailRequestStatus.contains("Waiting")) ||
//         (requestor.overtimeDetailRequestStatus.contains("RM") &&
//             requestor.overtimeDetailRequestStatus.contains("Waiting"))) {
//       return [
//         GestureDetector(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Center(
//               child: Text(
//                 "Cancel",
//                 style: styleHeader(18, color: Colors.red),
//               ),
//             ),
//           ),
//           onTap: () => showDialog(
//               context: context,
//               builder: (ctxt) => showDialogRemark(ctxt, "Cancel Overtime",
//                   requestor.overtimeDetailId.toString(), MyCons.OVERTIME_CANCEL,
//                   bloc: bloc,
//                   pageContext: context,
//                   isDetail: true,
//                   filterModel: filterModel)),
//         ),
//       ];
//     } else if ((requestor.overtimeDetailRequestStatus.contains("Rejected") ||
//         requestor.overtimeDetailRequestStatus.contains("Canceled"))) {
//       return [
//         GestureDetector(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//             child: Icon(
//               Icons.repeat,
//               color: Colors.white,
//             ),
//           ),
//           onTap: () async {
//             var result = await Get.toNamed(PageRouting.FORMOVERTIME,
//                 arguments: [requestor]);
//             Get.back(result: requestor.soId, closeOverlays: true);
//           },
//         ),
//       ];
//     } else
//       return [];
//   }
// }

// List<Widget> rightAction(OvertimeBloc bloc, OvertimeFilterModel filterModel,
//     {OvertimeData manager,
//     OvertimeData requestor,
//     String salesorderid,
//     BuildContext context}) {
//   if (manager != null) {
//     if (manager.nextApproval == MyCons.user.employeeId &&
//         !manager.overtimeDetailRequestStatus.contains("Rejected") &&
//         !manager.overtimeDetailRequestStatus.contains("Canceled")) {
//       return [
//         IconSlideAction(
//           caption: 'Accept',
//           color: Colors.green,
//           icon: Icons.done,
//           onTap: () => bloc.pushEvent(GantiStatusOvertime(
//               manager.overtimeDetailId.toString(),
//               MyCons.OVERTIME_ACCEPTED,
//               "-",
//               salesorderid,
//               false,
//               filterModel)),
//         ),
//         IconSlideAction(
//           caption: 'Reject',
//           color: Colors.red,
//           icon: Icons.cancel,
//           onTap: () {
//             showDialog(
//                 context: context,
//                 builder: (ctxt) => showDialogRemark(
//                     ctxt,
//                     "Reject Overtime",
//                     manager.overtimeDetailId.toString(),
//                     MyCons.OVERTIME_REJECTED,
//                     bloc: bloc,
//                     salesorderid: salesorderid,
//                     filterModel: filterModel));
//           },
//         ),
//       ];
//     } else if (MyCons.user.authorities.contains("MSFC")) {
//       if (manager.overtimeDetailRequestStatus.contains("MSFC")) {
//         return [
//           IconSlideAction(
//             caption: 'Accept',
//             color: Colors.green,
//             icon: Icons.done,
//             onTap: () => bloc.pushEvent(GantiStatusOvertime(
//                 manager.overtimeDetailId.toString(),
//                 MyCons.OVERTIME_ACCEPTED,
//                 "-",
//                 salesorderid,
//                 false,
//                 filterModel)),
//           ),
//           IconSlideAction(
//             caption: 'Reject',
//             color: Colors.red,
//             icon: Icons.cancel,
//             onTap: () {
//               showDialog(
//                   context: context,
//                   builder: (ctxt) => showDialogRemark(
//                       ctxt,
//                       "Reject Overtime",
//                       manager.overtimeDetailId.toString(),
//                       MyCons.OVERTIME_REJECTED,
//                       bloc: bloc,
//                       salesorderid: salesorderid,
//                       filterModel: filterModel));
//             },
//           ),
//         ];
//       }
//     } else {
//       if (manager.overtimeDetailRequestStatus == "Waiting For Confirmation" ||
//               (manager.overtimeDetailRequestStatus.contains("PM") &&
//                   MyCons.user.authorities.contains("PM") &&
//                   manager.overtimeDetailRequestStatus.contains("Waiting")) ||
//               (manager.overtimeDetailRequestStatus.contains("RM") &&
//                   MyCons.user.authorities.contains("RM") &&
//                   manager.overtimeDetailRequestStatus.contains("Waiting"))
//           //     ||
//           // (manager.overtimeDetailRequestStatus.contains("PM") &&
//           //     MyCons.user.authorities.contains("RM") &&
//           //     manager.overtimeDetailRequestStatus.contains("Waiting"))
//           ) {
//         return [
//           IconSlideAction(
//             caption: 'Accept',
//             color: Colors.green,
//             icon: Icons.done,
//             onTap: () => bloc.pushEvent(GantiStatusOvertime(
//                 manager.overtimeDetailId.toString(),
//                 MyCons.OVERTIME_ACCEPTED,
//                 "-",
//                 salesorderid,
//                 false,
//                 filterModel)),
//           ),
//           IconSlideAction(
//             caption: 'Reject',
//             color: Colors.red,
//             icon: Icons.cancel,
//             onTap: () {
//               showDialog(
//                   context: context,
//                   builder: (ctxt) => showDialogRemark(
//                       ctxt,
//                       "Reject Overtime",
//                       manager.overtimeDetailId.toString(),
//                       MyCons.OVERTIME_REJECTED,
//                       bloc: bloc,
//                       salesorderid: salesorderid,
//                       filterModel: filterModel));
//             },
//           ),
//         ];
//       } else
//         return [];
//     }
//   } else {
//     if (requestor.overtimeDetailRequestStatus == "Waiting For Confirmation" ||
//         (requestor.overtimeDetailRequestStatus.contains("PM") &&
//             requestor.overtimeDetailRequestStatus.contains("Waiting")) ||
//         (requestor.overtimeDetailRequestStatus.contains("RM") &&
//             requestor.overtimeDetailRequestStatus.contains("Waiting"))) {
//       return [
//         IconSlideAction(
//           caption: 'Cancel',
//           color: Colors.red,
//           icon: Icons.cancel,
//           onTap: () => showDialog(
//               context: context,
//               builder: (ctxt) => showDialogRemark(ctxt, "Cancel Overtime",
//                   requestor.overtimeDetailId.toString(), MyCons.OVERTIME_CANCEL,
//                   bloc: bloc, filterModel: filterModel)),
//         ),
//       ];
//     } else if (requestor.overtimeDetailRequestStatus.contains("Rejected") ||
//         requestor.overtimeDetailRequestStatus.contains("Canceled")) {
//       return [
//         IconSlideAction(
//           caption: 'Submit Ulang',
//           color: Colors.blueAccent,
//           icon: Icons.repeat,
//           onTap: () async {
//             var result = await Get.toNamed(PageRouting.FORMOVERTIME,
//                 arguments: [requestor]);
//             bloc.pushEvent(GetOvertime(filterModel));
//           },
//         ),
//       ];
//     } else
//       return [];
//   }
// }

// Widget showDialogRemark(BuildContext ctxt, String title,
//     String overtimeDetailId, String statusOvertime,
//     {OvertimeBloc bloc,
//     OvertimeFilterModel filterModel,
//     String salesorderid,
//     bool isDetail = false,
//     BuildContext pageContext}) {
//   TextEditingController _txt_remark = new TextEditingController();
//   return Dialog(
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(10),
//     ),
//     elevation: 5,
//     child: Container(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//               decoration: BoxDecoration(
//                   border: Border(
//                       bottom: BorderSide(
//                 color: Colors.black12,
//                 width: 1.0,
//               ))),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     Expanded(
//                         child: Text(
//                       title,
//                       style: styleHeader(18, fontWeight: FontWeight.bold),
//                     )),
//                     GestureDetector(
//                         onTap: () => Get.back(), child: Icon(Icons.close))
//                   ],
//                 ),
//               )),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               "Apakah anda yakin untuk melakukan aksi ini? ",
//               style: styleHeader(15, fontWeight: FontWeight.normal),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 TextFormField(
//                     keyboardType: TextInputType.text,
//                     controller: _txt_remark,
//                     maxLength: 100,
//                     textAlignVertical: TextAlignVertical.top,
//                     maxLines: 7,
//                     minLines: 3,
//                     decoration: new InputDecoration(
//                         enabledBorder: new OutlineInputBorder(
//                           borderRadius: new BorderRadius.circular(10.0),
//                           borderSide: BorderSide(color: MyColors.mainColor),
//                         ),
//                         focusedBorder: new OutlineInputBorder(
//                           borderRadius: new BorderRadius.circular(10.0),
//                           borderSide: BorderSide(color: MyColors.mainColor),
//                         ),
//                         labelText: "Remark",
//                         hintText: 'Tulis disini (jika diperlukan)',
//                         alignLabelWithHint: true,
//                         labelStyle: new TextStyle(
//                             color: MyCons.darkModeEnabled
//                                 ? Colors.white
//                                 : const Color(0xFF424242)))),
//               ],
//             ),
//           ),
//           Container(
//               decoration: BoxDecoration(
//                   border: Border(
//                       top: BorderSide(
//                 color: Colors.black12,
//                 width: 1.0,
//               ))),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     GestureDetector(
//                       // onTap: () => Navigator.pop(ctxt),
//                       onTap: () => Get.back(),
//                       child: Text(
//                         "Batal",
//                         style: styleHeader(15, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 5,
//                     ),
//                     GestureDetector(
//                         onTap: () {
//                           Get.back();
//                           bloc.pushEvent(GantiStatusOvertime(
//                               overtimeDetailId.toString(),
//                               statusOvertime,
//                               _txt_remark.text,
//                               salesorderid,
//                               isDetail,
//                               filterModel));
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             "Lanjutkan",
//                             style: styleHeader(15,
//                                 color: MyColors.mainColor,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ))
//                   ],
//                 ),
//               )),
//         ],
//       ),
//     ),
//   );
// }
