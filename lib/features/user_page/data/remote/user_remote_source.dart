import 'package:ojrek_hris/core/error/error_result.dart';
import 'package:ojrek_hris/core/remote/base_remote.dart';
import 'package:dio/dio.dart';
import 'package:ojrek_hris/core/remote/dio_model.dart';
import 'package:ojrek_hris/core/remote/response/default_response.dart';

class UserRemoteSource extends BaseRemote {
  UserRemoteSource(Dio dio) : super(dio);

  Future<Result<DefaultResponse>> logout() async {
    var url = ApiUrl.logout;
    final result = await postMethod(
      url,
      converter: (response) => DefaultResponse.fromJson(response),
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
