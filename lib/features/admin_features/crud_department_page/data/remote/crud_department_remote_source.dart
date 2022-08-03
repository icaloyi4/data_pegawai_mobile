import 'package:ojrek_hris/core/remote/base_remote.dart';
import 'package:dio/dio.dart';
import 'package:ojrek_hris/features/admin_features/crud_department_page/data/remote/get_department_position_response.dart';

import '../../../../../core/error/error_result.dart';
import '../../../../../core/remote/dio_model.dart';

class CrudDepartmentRemoteSource extends BaseRemote {
  CrudDepartmentRemoteSource(Dio dio) : super(dio);

  Future<Result<GetDepartmentPositionResponse>> getDeptPos() async {
    var url = "${ApiUrl.getDepartmentPosition}";
    final result = await getMethod(
      url,
      converter: (response) => GetDepartmentPositionResponse.fromJson(response),
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
