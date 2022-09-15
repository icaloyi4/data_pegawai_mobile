import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../core/assets/my_cons.dart';
import '../../../../../core/assets/my_enum.dart';
import '../../../../../core/widget/styling.dart';

class NewsWebview extends StatefulWidget {
  
  @override
  _NewsWebview createState() => _NewsWebview();
}

class _NewsWebview extends State<NewsWebview> {
  late String _url;
  bool _isLoading = true;
  late String _title;
  var loadingPercentage = 0;

  @override
  void initState() {
    // TODO: implement initState
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    _url = Get.arguments[0];
    _title = Get.arguments[1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${_title}",
            style: styleHeader(
                textStyleWeight: TextStyleWeight.Title3,
                color: MyCons.darkModeEnabled ? Colors.white : Colors.black54)),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: '${_url}',
            onPageStarted: (url) {
              setState(() {
                loadingPercentage = 0;
                _isLoading = true;
              });
            },
            onProgress: (progress) {
              setState(() {
                loadingPercentage = progress;
              });
            },
            onPageFinished: (url) {
              setState(() {
                loadingPercentage = 100;
                _isLoading = false;
              });
            },
          ),
          if (_isLoading)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${loadingPercentage} %"),
                  LinearProgressIndicator(
                    value: loadingPercentage / 100,
                    color: Colors.black,
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
