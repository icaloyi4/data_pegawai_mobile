import 'package:ojrek_hris/features/register_page/data/remote/register_model.dart';
import 'package:ojrek_hris/features/register_page/data/remote/register_response.dart';

import '../../data/local/register_local_source.dart';
import '../../data/remote/register_remote_source.dart';
import 'register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterRemoteSource _remoteSource;
  final RegisterLocalSource _localSource;

  RegisterRepositoryImpl(this._remoteSource, this._localSource);

  @override
  Future<void> signUp(RegisterModel registerModel,
      {required Function(RegisterResponse? user) onSuccess,
      required Function(String message, int code) onError}) async {
    try {
      var response = await _remoteSource.signUp(registerModel);
      if (response.body?.code == 200) {
        onSuccess(response.body);
      } else {
        onError(response.errorBody?['message'], response.errorBody?['code']);
      }
    } catch (e) {
      onError("Internal Server Error", 500);
    }
  }

  // @override
  // Future<void> getDataUser(
  //     {Function(usr.UserData user) onSuccess,
  //     Function(String message) onError}) async {
  //   try {
  //     var user = await _localSource.getDataUser();
  //     onSuccess(user);
  //   } on Exception catch (e) {
  //     onError(e.toString());
  //   }
  // }

  // @override
  // Future<void> getOvertime(
  //     {String startDate,
  //     String endDate,
  //     Function(List<OvertimeData> overtimeList) onSuccess,
  //     Function(String message) onError}) async {
  //   try {
  //     var response = await _remoteSource.getOvertime(
  //         startDate, endDate, MyCons.user.employeeId);
  //     if (response.body != null) {
  //       if (response.body.status == 200) {
  //         onSuccess(response.body.data);
  //       } else if (response.body.data.isEmpty) {
  //         onSuccess(response.body.data);
  //       } else {
  //         onError(response.body.message);
  //       }
  //     } else {
  //       if (response.code == 401) {
  //         onError("Unauthorized");
  //         await UserBloc.doingLogout();
  //       } else {
  //         if (response.errorBody != null) {
  //           onError("${response.errorBody['message']}");
  //         } else {
  //           onError("Koneksi Terputus");
  //         }
  //       }
  //     }
  //   } on Exception catch (e) {
  //     onError(e.toString());
  //   }
  // }

  // @override
  // Future<void> singleSourceOfTruth(
  //     {Function(List<MoviesRegisterData> movieList) onSuccess,
  //     Function(String message, List<MoviesRegisterData> movieList)
  //         onError}) async {
  //   try {
  //     var movies = await _localSource.getRegisterMovie(5, 0);
  //     onSuccess(movies);
  //   } on Exception catch (e) {
  //     onError(e.toString(), []);
  //   }
  // }

}
