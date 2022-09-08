part of 'attendance_bloc.dart';

@immutable
abstract class AttendanceState extends BlocState {}

class LoadingState extends AttendanceState {}

class InitState extends AttendanceState {}

class SuccessGetAttendance extends AttendanceState {
  final List<AttendanceData> attendanceList;

  SuccessGetAttendance(this.attendanceList);
}

class ErrorGetAttendance extends AttendanceState {}

// class SuccessGetDataUser extends UserState {
//   final usr.UserData user;
//   final List<OvertimeData> overtime;

//   SuccessGetDataUser(this.user, this.overtime);
// }
