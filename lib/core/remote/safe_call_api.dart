import 'package:ojrek_hris/core/error/error_result.dart';
import 'package:dio/dio.dart';

import '../assets/my_enum.dart';

typedef ResponseConverter<T> = T Function(dynamic response);
Future<Result<T>> safeCallApi<T>(
    Future<Response<dynamic>> call, ResponseConverter<T>? converter) async {
  try {
    var response = await call;
    var transform = converter!(response.data);
    return Result.success(transform);
  } on DioError catch (e) {
    // print(e);
    return Result.error(
        e.type, e.response?.statusCode ??= 500, e.response?.data);
  }
}

void responseHandler<T>(Result<T> result,
    {required Function(T? data) onSuccess,
    required Function(DioErrorType? dioError, int? code, dynamic errorBody)
        onError}) {
  switch (result.status) {
    case Status.SUCCESS:
      onSuccess(result.body);
      break;
    case Status.ERROR:
      onError(result.dioError, result.code, result.errorBody);
      break;
    default:
      throw ArgumentError();
  }
}

void responseHandler2<T, T2>(Result<T> result, Result<T2> result2,
    {required Function(T? data, T2? data2) onSuccess,
    required Function(Exception ex) onError}) {
  if (result.status == Status.SUCCESS && result2.status == Status.SUCCESS) {
    onSuccess(result.body, result2.body);
  } else if (result.status == Status.ERROR || result2.status == Status.ERROR) {
    String message =
        "Error : [${result.dioError}, ${result.code}, ${result.errorBody}], [${result2.dioError}, ${result.code}, ${result.errorBody}]";
    onError(Exception(message));
  } else {
    throw ArgumentError();
  }
}
