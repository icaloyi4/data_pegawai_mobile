import 'package:ojrek_hris/features/admin_features/crud_user_page/bloc/crud_user_bloc.dart';

class ApiUrl {
  ApiUrl._();
  static const baseUrl = "http://10.0.2.2:8000/api/";
  // static const baseUrl = "https://2cdd-182-2-164-84.ap.ngrok.io/api/";
  static const baseUrlDev =
      "http://103.101.225.146:8080/APIMOBILE/"; //http//:192.168.1.2:8082/APIMOBILE/
  // static const baseUrlDev =
  //     "http//:192.168.1.2:8082/APIMOBILE/"; //http//:192.168.1.2:8082/APIMOBILE/
  // static const login = "auth";
  static const login = "login";
  static const logout = "logout";
  static const register = "register";
  static const user = "users";
  static const news = "news";
  static const department = "departments";
  static const companies = "companies";
  static const registerDepartment = "registerDepartment";
  static const updateDepartment = "updateDepartment";
  static const getDepartmentPosition = "departments/getDepartmentWithPosition";
  static const deleteUser = "deleteUser";
}
