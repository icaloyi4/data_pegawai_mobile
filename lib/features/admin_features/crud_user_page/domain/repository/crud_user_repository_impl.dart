import 'package:ojrek_hris/features/admin_features/crud_user_page/data/remote/get_department_position_response.dart'
    as dept;
import 'package:ojrek_hris/features/admin_features/crud_user_page/data/remote/get_user_response.dart'
    as usr;

import '../../data/local/crud_user_local_source.dart';
import '../../data/remote/crud_user_remote_source.dart';
import 'crud_user_repository.dart';

class CrudUserRepositoryImpl implements CrudUserRepository {
  final CrudUserRemoteSource _remoteSource;
  final CrudUserLocalSource _localSource;

  CrudUserRepositoryImpl(this._remoteSource, this._localSource);

  @override
  Future<void> getDataUser(
      {Function(List<usr.Data> user)? onSuccess,
      Function(String message, int code)? onError}) async {
    try {
      var response = await _remoteSource.getUser();
      if (response.body?.code == 200) {
        onSuccess!(response.body!.data);
      } else {
        onError!(response.errorBody?['message'], response.errorBody?['code']);
      }
    } catch (e) {
      onError!("Internal Server Error", 500);
    }
  }

  @override
  Future<void> getDepartmenPosition(
      {Function(List<dept.Data> user)? onSuccess,
      Function(String message, int code)? onError}) async {
    try {
      var response = await _remoteSource.getDeptPos();
      if (response.body?.code == 200) {
        onSuccess!(response.body!.data);
      } else {
        onError!(response.errorBody?['message'], response.errorBody?['code']);
      }
    } catch (e) {
      onError!("Internal Server Error", 500);
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
  //     {Function(List<MoviesloginData> movieList) onSuccess,
  //     Function(String message, List<MoviesloginData> movieList)
  //         onError}) async {
  //   try {
  //     var movies = await _localSource.getloginMovie(5, 0);
  //     onSuccess(movies);
  //   } on Exception catch (e) {
  //     onError(e.toString(), []);
  //   }
  // }

}
