import 'package:ojrek_hris/core/remote/base_remote.dart';
import 'package:dio/dio.dart';
import 'package:ojrek_hris/core/remote/response/default_response.dart';
import 'package:ojrek_hris/features/admin_features/crud_user_page/data/remote/get_department_position_response.dart';
import 'package:ojrek_hris/features/admin_features/crud_user_page/data/remote/get_user_response.dart';
import 'package:ojrek_hris/features/admin_features/crud_user_page/data/remote/register_user_response.dart';

import '../../../../../core/error/error_result.dart';
import '../../../../../core/remote/dio_model.dart';

class CrudUserRemoteSource extends BaseRemote {
  CrudUserRemoteSource(Dio dio) : super(dio);

  Future<Result<GetUserResponse>> getUser() async {
    var getUser;
    var url = "${ApiUrl.user}";
    final result = await getMethod(
      url,
      converter: (response) => GetUserResponse.fromJson(response),
    );
    return result;
  }

  Future<Result<GetDepartmentPositionResponse>> getDeptPos() async {
    var url = "${ApiUrl.getDepartmentPosition}";
    final result = await getMethod(
      url,
      converter: (response) => GetDepartmentPositionResponse.fromJson(response),
    );
    return result;
  }

  Future<Result<RegisterUserResponse>> regisUser(
      DataUserRegister userInputModel, bool isUpdate) async {
    var url =
        isUpdate ? "${ApiUrl.user}/${userInputModel.id}" : "${ApiUrl.user}";
    final result = isUpdate
        ? await putMethod(
            url,
            data: userInputModel.toJson(),
            converter: (response) => RegisterUserResponse.fromJson(response),
          )
        : await postMethod(
            url,
            data: userInputModel.toJson(),
            converter: (response) => RegisterUserResponse.fromJson(response),
          );
    return result;
  }

  Future<Result<DefaultResponse>> deleteUser(int idUser) async {
    var url = "${ApiUrl.user}/${ApiUrl.deleteUser}/${idUser}";
    final result = await postMethod(
      url,
      converter: (response) => DefaultResponse.fromJson(response),
    );
    return result;
  }
}
