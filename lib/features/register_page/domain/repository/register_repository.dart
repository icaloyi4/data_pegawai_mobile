import 'package:ojrek_hris/features/register_page/data/remote/register_model.dart';

import '../../data/remote/register_response.dart';

abstract class RegisterRepository {
  Future<void> signUp(RegisterModel registerModel,
      {required Function(RegisterResponse? user) onSuccess, required Function(String message, int code) onError});
  // Future<void> getDataUser(
  //     {Function(usr.UserData user) onSuccess,
  //     Function(String message) onError});

  // Future<void> getOvertime(
  //     {String startDate,
  //     String endDate,
  //     Function(List<OvertimeData> overtimeList) onSuccess,
  //     Function(String message) onError}) {}
}
