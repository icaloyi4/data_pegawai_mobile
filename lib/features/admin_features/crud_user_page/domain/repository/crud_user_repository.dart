import 'package:ojrek_hris/features/admin_features/crud_user_page/data/remote/get_department_position_response.dart'
    as dept;

import '../../data/remote/get_user_response.dart';

abstract class CrudUserRepository {
  Future<void> getDataUser(
      {required Function(List<DataUserRegister> user) onSuccess,
      required Function(String message, int code) onError});

  Future<void> getDepartmenPosition(
      {required Function(List<dept.Data> user) onSuccess,
      required Function(String message, int code) onError});

  Future<void> registerUser(DataUserRegister userInputModel, bool isUpdate,
      {required Function() onSuccess, required Function(String message, int code) onError});

  Future<void> deleteUser(int idUser,
      {required Function() onSuccess, required Function(String message, int code) onError});

  // Future<void> getOvertime(
  //     {String startDate,
  //     String endDate,
  //     Function(List<OvertimeData> overtimeList) onSuccess,
  //     Function(String message) onError}) {}
}
