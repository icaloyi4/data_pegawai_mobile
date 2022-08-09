import 'package:ojrek_hris/features/login_page/data/remote/login_response.dart';

abstract class CrudCompanyRepository {
  updateCompany(Company? company, {required Function() onSuccess, required Function(dynamic message, dynamic code) onError}) {}
  // Future<void> getDataUser(
  //     {Function(usr.UserData user) onSuccess,
  //     Function(String message) onError});

  // Future<void> getOvertime(
  //     {String startDate,
  //     String endDate,
  //     Function(List<OvertimeData> overtimeList) onSuccess,
  //     Function(String message) onError}) {}
}
