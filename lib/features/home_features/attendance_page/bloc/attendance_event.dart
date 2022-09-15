part of 'attendance_bloc.dart';

@immutable
abstract class AttendanceEvent extends BlocEvent {}

class GetAttendance extends AttendanceEvent {
  final BuildContext context;

  GetAttendance(this.context);
}

class CheckInOut extends AttendanceEvent {
  final BuildContext context;
  final CheckInOutModel checkInOutModel;

  CheckInOut(this.context, this.checkInOutModel);
}
