part of 'attendance_bloc.dart';

@immutable
abstract class AttendanceEvent extends BlocEvent {}

class Logout extends AttendanceEvent {
  final BuildContext context;

  Logout(this.context);
}

class GetAttendance extends AttendanceEvent {
  final BuildContext context;

  GetAttendance(this.context);
}
