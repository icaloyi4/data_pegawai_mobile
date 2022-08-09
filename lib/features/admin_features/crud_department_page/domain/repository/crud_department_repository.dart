import 'package:ojrek_hris/features/admin_features/crud_department_page/data/remote/get_department_position_response.dart';

abstract class CrudDepartmentRepository {
  getDepartmenPosition({required Function(List<DataDepartment> dept) onSuccess, required Function(dynamic message, dynamic code) onError}) {}

  registerDepartment(DataDepartment departmentInputModel, bool isUpdate, {required  Function() onSuccess, required Function(String message, int code) onError}) {}

  deleteUser(int idDepartment, {required Function() onSuccess, required Function(String message, int code) onError}) {}
  // Future<void> getDataUser(
  //     {Function(usr.UserData user) onSuccess,
  //     Function(String message) onError});

  // Future<void> getOvertime(
  //     {String startDate,
  //     String endDate,
  //     Function(List<OvertimeData> overtimeList) onSuccess,
  //     Function(String message) onError}) {}
}
