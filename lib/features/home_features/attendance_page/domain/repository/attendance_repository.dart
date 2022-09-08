import 'package:ojrek_hris/features/home_features/attendance_page/data/remote/get_attendance_response.dart';

abstract class AttendanceRepository {
  Future<void> getAttendance(
    {required Function(List<AttendanceData> attendanceList) onSuccess, required Function(String message, int code) onError}
  );
  // Future<void> getDataUser(
  //     {Function(usr.UserData user) onSuccess,
  //     Function(String message) onError});

  // Future<void> getOvertime(
  //     {String startDate,
  //     String endDate,
  //     Function(List<OvertimeData> overtimeList) onSuccess,
  //     Function(String message) onError}) {}
}
