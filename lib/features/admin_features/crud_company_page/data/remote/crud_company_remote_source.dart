import 'package:ojrek_hris/core/remote/base_remote.dart';
import 'package:dio/dio.dart';
import 'package:ojrek_hris/features/login_page/data/remote/login_response.dart';

import '../../../../../core/error/error_result.dart';
import '../../../../../core/remote/dio_model.dart';
import '../../../../../core/remote/response/default_response.dart';

class CrudCompanyRemoteSource extends BaseRemote {
  CrudCompanyRemoteSource(Dio dio) : super(dio);

  Future<Result<DefaultResponse>> updateCompany(Company? company) async {
    var url = "${ApiUrl.companies}/${company?.id}";
    final result = await putMethod(
      url,
      data: company?.toJson(),
      converter: (response) => DefaultResponse.fromJson(response),
    );
    return result;

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
}
