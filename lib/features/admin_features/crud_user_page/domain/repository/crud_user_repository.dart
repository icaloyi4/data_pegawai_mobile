import 'package:ojrek_hris/features/admin_features/crud_user_page/bloc/crud_user_bloc.dart';
import 'package:ojrek_hris/features/admin_features/crud_user_page/data/remote/get_department_position_response.dart'
    as dept;
import 'package:ojrek_hris/features/admin_features/crud_user_page/data/remote/get_user_response.dart'
    as usr;

abstract class CrudUserRepository {
  Future<void> getDataUser(
      {Function(List<usr.Data> user) onSuccess,
      Function(String message, int code) onError});

  Future<void> getDepartmenPosition(
      {Function(List<dept.Data> user) onSuccess,
      Function(String message, int code) onError});

  // Future<void> getOvertime(
  //     {String startDate,
  //     String endDate,
  //     Function(List<OvertimeData> overtimeList) onSuccess,
  //     Function(String message) onError}) {}
}
