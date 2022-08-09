import 'package:ojrek_hris/core/remote/base_remote.dart';
import 'package:dio/dio.dart';
import 'package:ojrek_hris/core/remote/response/default_response.dart';
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

  Future<Result<DefaultResponse>> registerDept(
      DataDepartment departmentInputModel, bool isUpdate) async {
    var url =
        "${ApiUrl.department}/${isUpdate ? ApiUrl.updateDepartment : ApiUrl.registerDepartment}";
    final result = await postMethod(
      url,
      data: departmentInputModel.toJson(),
      converter: (response) => DefaultResponse.fromJson(response),
    );
    return result;
  }

  Future<Result<DefaultResponse>> deleteDepartment(int idDepartment) async {
    var url = "${ApiUrl.department}/${idDepartment}";
    final result = await delMethod(
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
