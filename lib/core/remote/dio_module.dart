import 'package:dio/adapter.dart';
import 'package:flutter/foundation.dart';
// import 'dart:io' if (dart.library.html) 'dart:html';
//import 'dart:io' if (dart.library.html) 'package:dio/adapter_browser.dart' as html;
import 'package:dio/dio.dart';
import 'package:dio/adapter_browser.dart'
    if (dart.library.io) 'package:ojrek_hris/core/remote/adapter_browser.dart' as html;
// import 'package:ojrek_hris/core/remote/adapter_browser.dart'
//     if (dart.library.html) 'package:dio/adapter_browser.dart' as html;

import 'dio_model.dart';
import 'logging_interceptors.dart';

class DioModule with DioMixin implements Dio {
  DioModule() {
    options = BaseOptions(
      baseUrl: ApiUrl.baseUrl,
      contentType: 'application/json',
      connectTimeout: 30000,
      sendTimeout: 30000,
      receiveTimeout: 30000,
    );

    this.options = options;

    interceptors.add(LoggingInterceptor());
    if (kIsWeb) {
      httpClientAdapter = html.BrowserHttpClientAdapter();
    } else {
      httpClientAdapter = DefaultHttpClientAdapter();
    }
  }
}
