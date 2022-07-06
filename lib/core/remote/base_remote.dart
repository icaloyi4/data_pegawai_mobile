import 'package:clean_architecture_null_safety/core/error/error_result.dart';
import 'package:clean_architecture_null_safety/core/remote/safe_call_api.dart';
import 'package:dio/dio.dart';
import 'dio_model.dart';

abstract class BaseRemote {
  final Dio _dio;
  BaseRemote(this._dio);
  Future<Result<T>> getMethod<T>(
    String endpoint, {
    Map<String, String>? headers,
    ResponseConverter<T>? converter,
  }) async {
    if (headers == null) {
      headers = {
        "Accept": "application/json",
        // "Authorization": "${MyCons.user.prefix} ${MyCons.user.token}"
      };
    } else {
      headers.putIfAbsent("Accept", () => "application/json");
      // headers.putIfAbsent(
      //     "Authorization", () => "${MyCons.user.prefix} ${MyCons.user.token}");
    }
    Options opsi = Options(headers: headers);
    var response =
        await safeCallApi(_dio.get(endpoint, options: opsi), converter);
    return response;
  }

  Future<Result<T>> postMethod<T>(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? data,
    ResponseConverter<T>? converter,
  }) async {
    if (headers == null) {
      headers = {
        "Accept": "application/json",
        // "Authorization": "${MyCons.user.prefix} ${MyCons.user.token}"
      };
    } else {
      headers.putIfAbsent("Accept", () => "application/json");
      // headers.putIfAbsent(
      //     "Authorization", () => "${MyCons.user.prefix} ${MyCons.user.token}");
    }
    Options opsi = Options(headers: headers);
    var response = await safeCallApi(
        _dio.post(endpoint, data: data, options: opsi), converter);
    return response;
  }

  Future<Result<T>> postMethodWithouKey<T>(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? data,
    ResponseConverter<T>? converter,
  }) async {
    if (headers == null) {
      headers = {
        "Accept": "application/json",
        // "Authorization":
        //     "${ApiUrl.PREFIX} ${FlavorConfig.isProduction() ? ApiUrl.TOKEN_PROD : ApiUrl.TOKEN_DEV}"
      };
    } else {
      headers.putIfAbsent("Accept", () => "application/json");
      // headers.putIfAbsent(
      //     "Authorization",
      //     () =>
      //         "${ApiUrl.PREFIX} ${FlavorConfig.isProduction() ? ApiUrl.TOKEN_PROD : ApiUrl.TOKEN_DEV}");
    }
    Options opsi = Options(headers: headers);
    var response = await safeCallApi(
        _dio.post(endpoint, data: data, options: opsi), converter);
    return response;
  }
}
