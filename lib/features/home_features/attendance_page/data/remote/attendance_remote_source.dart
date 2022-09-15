import 'package:http_parser/http_parser.dart';
import 'package:ojrek_hris/core/error/error_result.dart';
import 'package:ojrek_hris/core/remote/base_remote.dart';
import 'package:dio/dio.dart';
import 'package:ojrek_hris/core/remote/dio_model.dart';
import 'package:ojrek_hris/core/remote/response/default_response.dart';
import 'package:ojrek_hris/features/home_features/attendance_page/data/remote/check_in_out.dart';
import 'package:ojrek_hris/features/home_features/attendance_page/data/remote/get_attendance_response.dart';

class AttendanceRemoteSource extends BaseRemote {
  AttendanceRemoteSource(Dio dio) : super(dio);

  Future<Result<GetAttendanceResponse>> getAttendance() async {
    var url = ApiUrl.attendance;
    final result = await getMethod(
      url,
      converter: (response) => GetAttendanceResponse.fromJson(response),
    );
    return result;
  }

  Future<Result<DefaultResponse>> checkInOut(CheckInOutModel data) async {
    var url = (data.isCheckIn)
        ? ApiUrl.attendance
        : ApiUrl.attendance + "/${data.id}";
    if (data.isCheckIn) {
      String fileName = data.image!.path.split('/').last;
      FormData formData = FormData.fromMap({
        "check_in":data.time,
        "notes_check_in":data.notes,
        "location_check_in":data.location,
        "image": await MultipartFile.fromFile(
          data.image!.path,
          filename: fileName,
          contentType: new MediaType("image", "jpeg"), //important
        ),
      });
      final result = await postMethodWithFormData(
        url,
        data: formData,
        converter: (response) => DefaultResponse.fromJson(response),
      );
      return result;
    } else {
      String fileName = data.image!.path.split('/').last;
      FormData formData = FormData.fromMap({
        "check_out":data.time,
        "notes_check_out":data.notes,
        "location_check_out":data.location,
        "image": await MultipartFile.fromFile(
          data.image!.path,
          filename: fileName,
          contentType: new MediaType("image", "jpeg"), //important
        ),
      });
      final result = await postMethodWithFormData(
        url,
        data: formData,
        converter: (response) => DefaultResponse.fromJson(response),
      );
      return result;
    }
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
