import 'package:ojrek_hris/core/remote/base_remote.dart';
import 'package:dio/dio.dart';
import 'package:ojrek_hris/features/register_page/data/remote/register_model.dart';

import '../../../../core/error/error_result.dart';
import '../../../../core/remote/dio_model.dart';
import 'register_response.dart';

class RegisterRemoteSource extends BaseRemote {
  RegisterRemoteSource(Dio dio) : super(dio);

  Future<Result<RegisterResponse>> signUp(RegisterModel registerModel) async {
    var url = "${ApiUrl.register}";
    var result = await postMethodWithouKey(
      url,
      data: registerModel.toJson(),
      converter: (response) => RegisterResponse.fromJson(response),
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
