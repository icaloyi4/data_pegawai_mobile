import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:ojrek_hris/features/home_features/attendance_page/bloc/attendance_bloc.dart';
import 'package:ojrek_hris/features/home_features/attendance_page/ui/widget/list_attendance_page.dart';

import '../../../../core/assets/my_color.dart';
import '../../../../core/assets/my_cons.dart';
import '../../../../core/assets/my_enum.dart';
import '../../../../core/base/base_stateful.dart';
import '../../../../core/widget/error_text.dart';
import '../../../../core/widget/styling.dart';

class AttendancePage extends StatefulWidget {
  @override
  _AttendancePage createState() => _AttendancePage();
}

class _AttendancePage
    extends BaseState<AttendanceBloc, AttendanceState, AttendancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.5,
        title: Text("Attendance",
            style: styleHeader(
                textStyleWeight: TextStyleWeight.Title3,
                color: MyCons.darkModeEnabled ? Colors.white : Colors.black54)),
      ),
      body: Column(
        children: [
          // Container(
          //   color: Colors.white,
          //   child: Padding(
          //     padding: const EdgeInsets.all(15.0),
          //     child: Container(
          //       child: TextFormField(
          //         decoration:
          //             fieldDecoration("Search", icon: CupertinoIcons.search),
          //         onChanged: (value) {
          //           // bloc.pushEvent(FilterUser(value, _dataUser));
          //         },
          //       ),
          //     ),
          //   ),
          // ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder<AttendanceState>(
                  stream: bloc.stateStream,
                  initialData: LoadingState(),
                  builder: (blocCtx, snapshot) =>
                      mapStateHandler(snapshot.data)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.pushEvent(GetAttendance(context));
  }

  @override
  AttendanceBloc initBloc() {
    return KiwiContainer().resolve<AttendanceBloc>();
  }

  @override
  Widget mapStateHandler(AttendanceState? state) {
    if (state is LoadingState) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is SuccessGetAttendance) {
      // _dataUser = state.dataUser;
      return ListAttendance(
        attendanceList: state.attendanceList,
        bloc : bloc,
        parentPageCtx: context,
      );
    }

    // if (state is SuccesGetDepartmentFilter) {
    //   // _dataUserFiltered = state.dataUser;
    //   return listUser(_dataUserFiltered);
    // }

    if (state is ErrorGetAttendance) {
      return ErrorText(
          message: "Something wrong, try again",
          tryAgain: () {
            bloc.pushEvent(GetAttendance(context));
          });
    }

    return Container();
  }
}
