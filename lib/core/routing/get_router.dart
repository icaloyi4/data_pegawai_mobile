import 'package:flutter/foundation.dart';
import 'package:ojrek_hris/core/widget/maps_picker.dart';
import 'package:ojrek_hris/features/admin_features/crud_announcement_page/ui/crud_announcement_page.dart';
import 'package:ojrek_hris/features/admin_features/crud_company_page/ui/crud_company_page.dart';
import 'package:ojrek_hris/features/admin_features/crud_department_page/ui/crud_department_page.dart';
import 'package:ojrek_hris/features/admin_features/crud_department_page/ui/list_department_page.dart';
import 'package:ojrek_hris/features/admin_features/crud_news_page/ui/crud_news_page.dart';
import 'package:ojrek_hris/features/admin_features/crud_news_page/ui/list_news_page.dart';
import 'package:ojrek_hris/features/admin_features/crud_user_page/ui/crud_user_page.dart';
import 'package:ojrek_hris/features/admin_features/crud_user_page/ui/list_user_page.dart';
import 'package:ojrek_hris/features/home_features/attendance_page/ui/attendance_page.dart';
import 'package:ojrek_hris/features/home_features/attendance_page/ui/widget/list_attendance_page.dart';
import 'package:ojrek_hris/features/main_page.dart';
import 'package:ojrek_hris/features/register_page/ui/register_company_page.dart';
import 'package:ojrek_hris/features/register_page/ui/register_success_page.dart';
import 'package:ojrek_hris/features/register_page/ui/register_user_page.dart';
import 'package:ojrek_hris/features/splash_screen.dart';
import 'package:get/get.dart';

import '../../features/admin_features/crud_announcement_page/ui/list_announcement_page.dart';
import '../../features/home_features/home_page/ui/announce_show_page.dart';
import '../../features/home_features/home_page/ui/widget/news_all.dart';
import '../../features/home_features/home_page/ui/widget/news_webview.dart';
import '../../features/login_page/ui/login_page.dart';
import '../../features/main_page_web.dart';
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
      GetPage(
          name: PageRouting.REGISTER_SUCCESS,
          page: () => RegisterSuccessPage(),
          transition: Transition.rightToLeftWithFade),
      GetPage(
          name: PageRouting.HOME,
          page: () => (kIsWeb) ? MainPageWeb() : MainPage()),
      GetPage(name: PageRouting.CRUD_USER, page: () => ListUserPage()),
      GetPage(name: PageRouting.ADD_USER, page: () => CrudUserPage()),
      GetPage(
          name: PageRouting.CRUD_DEPARTMENT, page: () => ListDepartmentPage()),
      GetPage(
          name: PageRouting.ADD_DEPARTMENT, page: () => CrudDepartmentPage()),
      GetPage(name: PageRouting.EDIT_COMPANY, page: () => CrudCompanyPage()),
      GetPage(name: PageRouting.NEWS_WEBVIEW, page: () => NewsWebview()),
      GetPage(name: PageRouting.NEWS_ALL, page: () => NewsAllPage()),
      GetPage(name: PageRouting.CRUD_NEWS, page: () => ListNewsPage()),
      GetPage(name: PageRouting.ADD_NEWS, page: () => CrudNewsPage()),
      GetPage(name: PageRouting.MAP_PICKER, page: () => MapPickerPage()),
      GetPage(
          name: PageRouting.CRUD_ANNOUNCEMENTS,
          page: () => ListAnnouncementPage()),
      GetPage(
          name: PageRouting.ADD_ANNOUNCEMENTS,
          page: () => CrudAnnouncementPage()),
      GetPage(
          name: PageRouting.SHOW_ANNOUNCEMENT, page: () => AnnounceShowPage()),
      GetPage(name: PageRouting.ATTENDANCE, page: () => AttendancePage()),
    ];
  }
}
