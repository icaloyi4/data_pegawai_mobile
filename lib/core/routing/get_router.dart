import 'package:ojrek_hris/features/register_page/ui/register_company_page.dart';
import 'package:ojrek_hris/features/register_page/ui/register_user_page.dart';
import 'package:ojrek_hris/features/splash_screen.dart';
import 'package:get/get.dart';

import '../../features/login_page/ui/login_page.dart';
import '../../features/welcome_screen.dart';
import 'page_routing.dart';

class GetRouter {
  static List<GetPage> generateRoute() {
    return [
      GetPage(name: PageRouting.ROOT, page: () => SplashScreen()),
      GetPage(name: PageRouting.WELCOME, page: () => WelcomeScreen()),
      // GetPage(name: r.Routing.DETAIL_MOVIE, page: () => DetailScreen()),
      GetPage(name: PageRouting.LOGIN, page: () => LoginPage()),
      GetPage(name: PageRouting.REGISTER, page: () => RegisterPage()),
      GetPage(
          name: PageRouting.REGISTER_COMPANY,
          page: () => RegisterCompanyPage(),
          transition: Transition.rightToLeftWithFade),
    ];
  }
}
