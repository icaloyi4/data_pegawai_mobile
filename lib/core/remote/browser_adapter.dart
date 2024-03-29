import 'dart:async';
import 'dart:typed_data';
import 'package:dio/dio.dart';
// import 'package:ojrek_hris/core/downloader/downloader.dart'
//     if (dart.library.io) 'package:ojrek_hris/core/downloader/downloader_mobile.dart'
//     if (dart.library.js) 'package:ojrek_hris/core/downloader/downloader_web.dart';

HttpClientAdapter createAdapter() => BrowserHttpClientAdapter();

class BrowserHttpClientAdapter implements HttpClientAdapter {
  @override
  void close({bool force = false}) {
    // TODO: implement close
  }

  @override
  Future<ResponseBody> fetch(RequestOptions options,
      Stream<Uint8List>? requestStream, Future? cancelFuture) {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  /// These are aborted if the client is closed.

  // var _xhrs;
  // // final _xhrs = <HttpRequest>[];

  // /// Whether to send credentials such as cookies or authorization headers for
  // /// cross-site requests.
  // ///
  // /// Defaults to `false`.
  // ///
  // /// You can also override this value in Options.extra['withCredentials'] for each request
  // bool withCredentials = false;

  // @override
  // Future<ResponseBody> fetch(RequestOptions options,
  //     Stream<Uint8List>? requestStream, Future? cancelFuture) {
  //   var xhr;
  //   if (kIsWeb) {
  //     _xhrs = <html.HttpRequest>[];
  //     xhr = html.HttpRequest();
  //   } else {
  //     _xhrs = <mobile.HttpRequest>[];
  //     xhr = mobile.HttpRequest;
  //   }
  //   _xhrs.add(xhr);

  //   xhr
  //     ..open(options.method, options.uri.toString(), async: true)
  //     ..responseType = 'blob';

  //   var _withCredentials = options.extra['withCredentials'];

  //   if (_withCredentials != null) {
  //     xhr.withCredentials = _withCredentials == true;
  //   } else {
  //     xhr.withCredentials = withCredentials;
  //   }

  //   options.headers.remove(Headers.contentLengthHeader);
  //   options.headers.forEach((key, v) => xhr.setRequestHeader(key, '$v'));

  //   var completer = Completer<ResponseBody>();

  //   xhr.onLoad.first.then((_) {
  //     // TODO: Set the response type to "arraybuffer"() when issue 18542 is fixed.
  //     var blob;
  //     var reader;
  //     if (kIsWeb) {
  //       blob = xhr.response != null ? (xhr.response as html.Blob) : html.Blob([]);
  //       reader = html.FileReader();
  //     }

  //     reader.onLoad.first.then((_) {
  //       var body = reader.result as Uint8List;
  //       completer.complete(
  //         ResponseBody.fromBytes(
  //           body,
  //           xhr.status,
  //           headers:
  //               xhr.responseHeaders.map((k, v) => MapEntry(k, v.split(','))),
  //           statusMessage: xhr.statusText,
  //           isRedirect: xhr.status == 302 || xhr.status == 301,
  //         ),
  //       );
  //     });

  //     reader.onError.first.then((error) {
  //       completer.completeError(
  //         DioError(
  //           type: DioErrorType.response,
  //           error: error,
  //           requestOptions: options,
  //         ),
  //         StackTrace.current,
  //       );
  //     });
  //     reader.readAsArrayBuffer(blob);
  //   });

  //   xhr.onError.first.then((_) {
  //     // Unfortunately, the underlying XMLHttpRequest API doesn't expose any
  //     // specific information about the error itself.
  //     completer.completeError(
  //       DioError(
  //         type: DioErrorType.response,
  //         error: 'XMLHttpRequest error.',
  //         requestOptions: options,
  //       ),
  //       StackTrace.current,
  //     );
  //   });

  //   cancelFuture?.then((_) {
  //     if (xhr.readyState < 4 && xhr.readyState > 0) {
  //       try {
  //         xhr.abort();
  //       } catch (e) {
  //         // ignore
  //       }
  //     }
  //   });

  //   if (requestStream != null) {
  //     requestStream.toList().then((value) {
  //       var length = value.fold<int>(
  //           0, (previousValue, element) => previousValue + element.length);
  //       var res = Uint8List(length);
  //       var start = 0;
  //       for (var list in value) {
  //         res.setRange(start, start += list.length, list);
  //       }
  //       return res;
  //     }).then(xhr.send);
  //   } else {
  //     xhr.send();
  //   }

  //   return completer.future.whenComplete(() {
  //     _xhrs.remove(xhr);
  //   });
  // }

  // /// Closes the client.
  // ///
  // /// This terminates all active requests.
  // @override
  // void close({bool force = false}) {
  //   if (force) {
  //     for (var xhr in _xhrs) {
  //       xhr.abort();
  //     }
  //   }
  //   _xhrs.clear();
  // }
}
