import 'package:ojrek_hris/core/assets/my_cons.dart';
import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onError(DioError dioError, ErrorInterceptorHandler handler) {
    print(
        "<-- ${dioError.message} ${(dioError.response?.requestOptions != null ? (dioError.response?.requestOptions.path) : 'URL')}");
    print(
        "${dioError.response != null ? dioError.response?.data : 'Unknown Error'}");
    print("<-- End error");
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (MyCons.IS_DEBUG)
      print(
          "<-- ${response.statusCode} ${(response.requestOptions != null ? (response.requestOptions.path) : 'URL')}");
    if (MyCons.IS_DEBUG) print("Headers:");
    if (MyCons.IS_DEBUG) response.headers.forEach((k, v) => print('$k: $v'));
    print("Response: ${response.data}");
    print("<-- END HTTP");
  }
}
