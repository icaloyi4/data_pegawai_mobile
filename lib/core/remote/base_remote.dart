import 'package:ojrek_hris/core/error/error_result.dart';
import 'package:ojrek_hris/core/remote/safe_call_api.dart';
import 'package:dio/dio.dart';
import '../assets/my_cons.dart';
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
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${MyCons.dataUser?.token}"
      };
    } else {
      headers.putIfAbsent("Accept", () => "application/json");
      headers.putIfAbsent("Content-Type", () => "application/json");
      headers.putIfAbsent(
          "Authorization", () => "Bearer ${MyCons.dataUser?.token}");
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
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${MyCons.dataUser?.token}"
      };
    } else {
      headers.putIfAbsent("Accept", () => "application/json");
      headers.putIfAbsent("Content-Type", () => "application/json");
      headers.putIfAbsent(
          "Authorization", () => "Bearer ${MyCons.dataUser?.token}");
    }
    Options opsi = Options(headers: headers);
    // var responsenya = await _dio.post(endpoint, data: data, options: opsi);
    // print(responsenya);
    var response = await safeCallApi(
        _dio.post(endpoint, data: data, options: opsi), converter);

    return response;
  }
  Future<Result<T>> postMethodWithFormData<T>(
    String endpoint, {
    Map<String, String>? headers,
    FormData? data,
    ResponseConverter<T>? converter,
  }) async {
    if (headers == null) {
      headers = {
        "Accept": "application/json",
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${MyCons.dataUser?.token}"
      };
    } else {
      headers.putIfAbsent("Accept", () => "application/json");
      headers.putIfAbsent("Content-Type", () => "application/json");
      headers.putIfAbsent(
          "Authorization", () => "Bearer ${MyCons.dataUser?.token}");
    }
    Options opsi = Options(headers: headers);
    // var responsenya = await _dio.post(endpoint, data: data, options: opsi);
    // print(responsenya);
    var response = await safeCallApi(
        _dio.post(endpoint, data: data, options: opsi), converter);

    return response;
  }

  Future<Result<T>> putMethod<T>(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? data,
    ResponseConverter<T>? converter,
  }) async {
    if (headers == null) {
      headers = {
        "Accept": "application/json",
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${MyCons.dataUser?.token}"
      };
    } else {
      headers.putIfAbsent("Accept", () => "application/json");
      headers.putIfAbsent("Content-Type", () => "application/json");
      headers.putIfAbsent(
          "Authorization", () => "Bearer ${MyCons.dataUser?.token}");
    }
    Options opsi = Options(headers: headers);
    // var responsenya = await _dio.post(endpoint, data: data, options: opsi);
    // print(responsenya);
    var response = await safeCallApi(
        _dio.put(endpoint, data: data, options: opsi), converter);

    return response;
  }

  Future<Result<T>> delMethod<T>(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? data,
    ResponseConverter<T>? converter,
  }) async {
    if (headers == null) {
      headers = {
        "Accept": "application/json",
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${MyCons.dataUser?.token}"
      };
    } else {
      headers.putIfAbsent("Accept", () => "application/json");
      headers.putIfAbsent("Content-Type", () => "application/json");
      headers.putIfAbsent(
          // "Authorization", () => "Bearer ${MyCons.dataUser?.token}");
          "Authorization", () => "Bearer ${MyCons.dataUser?.token}");
    }
    Options opsi = Options(headers: headers);
    // var responsenya = await _dio.post(endpoint, data: data, options: opsi);
    // print(responsenya);
    var response = await safeCallApi(
        _dio.delete(endpoint, data: data, options: opsi), converter);

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
        'Content-Type': 'application/json',
        // "Authorization":
        //     "${ApiUrl.PREFIX} ${FlavorConfig.isProduction() ? ApiUrl.TOKEN_PROD : ApiUrl.TOKEN_DEV}"
      };
    } else {
      headers.putIfAbsent("Accept", () => "application/json");
      headers.putIfAbsent("Content-Type", () => "application/json");
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
