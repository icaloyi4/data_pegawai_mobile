import 'package:ojrek_hris/core/error/error_result.dart';
import 'package:ojrek_hris/core/remote/base_remote.dart';
import 'package:dio/dio.dart';
import 'package:ojrek_hris/core/remote/dio_model.dart';
import 'package:ojrek_hris/core/remote/response/default_response.dart';
import 'package:ojrek_hris/features/home_features/attendance_page/data/remote/get_attendance_response.dart';

class AttendanceRemoteSource extends BaseRemote {
  AttendanceRemoteSource(Dio dio) : super(dio);

  Future<Result<GetAttendanceResponse>> getAttendance()async {
    var url = ApiUrl.attendance;
    final result = await getMethod(
      url,
      converter: (response) => GetAttendanceResponse.fromJson(response),
    );
    return result;
  }

  

  // Future<Result<OvertimeResponse>> getOvertime(
  //     String startDate, String endDate, int id) async {
  //   var url =
  //       "${ApiUrl.getOvetimeBaseId}$id?enddate=${endDate}&startdate=${startDate}";
  //   final result = await getMethod(
  //     url,
  //     converter: (response) => OvertimeResponse.fromJson(response),
  //   );
  //   return result;
  // }
}
