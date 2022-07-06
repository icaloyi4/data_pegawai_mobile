import 'package:clean_architecture_null_safety/features/splash_screen.dart';
import 'package:get/get.dart';

import 'page_routing.dart';

class GetRouter {
  static List<GetPage> generateRoute() {
    return [
      GetPage(name: PageRouting.ROOT, page: () => SplashScreen())
      // GetPage(name: r.Routing.DETAIL_MOVIE, page: () => DetailScreen()),
      // GetPage(name: r.Routing.login_MOVIE, page: () => loginPage())
    ];
  }
}
