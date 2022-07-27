import 'package:ojrek_hris/core/remote/base_remote.dart';
import 'package:dio/dio.dart';
import 'package:ojrek_hris/features/login_page/data/remote/login_response.dart';

import '../../../../core/error/error_result.dart';
import '../../../../core/remote/dio_model.dart';

class LoginRemoteSource extends BaseRemote {
  LoginRemoteSource(Dio dio) : super(dio);

  Future<Result<LoginResponse>> login(String email, String password) async {
    var url = "${ApiUrl.login}";
    var result = await postMethodWithouKey(
      url,
      data: {"email": email, "password": password},
      converter: (response) => LoginResponse.fromJson(response),
    );
    return result;
  }
}
