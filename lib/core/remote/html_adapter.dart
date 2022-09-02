

import 'dart:html';

class HtmlAdapter {
  static void openBrowser(String url, String method){
    window.open(url, method);
  }
}
