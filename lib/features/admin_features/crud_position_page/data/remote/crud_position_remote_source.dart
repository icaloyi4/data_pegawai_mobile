import 'package:ojrek_hris/core/remote/base_remote.dart';
import 'package:dio/dio.dart';

class CrudPositionRemoteSource extends BaseRemote {
  CrudPositionRemoteSource(Dio dio) : super(dio);

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
