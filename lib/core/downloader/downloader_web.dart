// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:convert';
import 'dart:html' as html;

void downloadFile(List<int> data, String fileName) {
  final base64encodedData = base64Encode(data);
  final anchor = html.AnchorElement(
    href: 'data:application/octet-stream;charset=utf-8;'
        'base64,$base64encodedData',
  )
    ..setAttribute('download', fileName)
    ..click();

  html.document.body?.children.remove(anchor);
}
