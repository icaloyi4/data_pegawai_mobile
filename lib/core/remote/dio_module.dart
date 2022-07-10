import 'package:ojrek_hris/core/config/flavor_config.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import 'dio_model.dart';
import 'logging_interceptors.dart';

class DioModule with DioMixin implements Dio {
  DioModule() {
    options = BaseOptions(
      baseUrl: FlavorConfig.isProduction() ? ApiUrl.baseUrl : ApiUrl.baseUrlDev,
      contentType: 'application/json',
      connectTimeout: 30000,
      sendTimeout: 30000,
      receiveTimeout: 30000,
    );

    this.options = options;
    interceptors.add(LoggingInterceptor());
    httpClientAdapter = DefaultHttpClientAdapter();
  }
}
