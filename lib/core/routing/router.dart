import 'package:ojrek_hris/core/routing/page_routing.dart';
import 'package:ojrek_hris/features/splash_screen.dart';
import 'package:flutter/material.dart';

import 'undefined_view.dart';

class RouterApp {
  static Route<dynamic> generateRoute(RouteSettings? settings) {
    if (settings?.name != null) {
      switch (settings?.name) {
        case PageRouting.ROOT:
          return MaterialPageRoute(
            builder: (_) => SplashScreen(),
          );
        default:
          return MaterialPageRoute(
              builder: (_) => UndefinedView(
                    routeName: "",
                  ));
      }
    } else {
      return MaterialPageRoute(
          builder: (_) => UndefinedView(
                routeName: "",
              ));
    }
  }
}
