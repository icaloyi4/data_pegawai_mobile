import 'package:ojrek_hris/features/admin_features/crud_department_page/data/remote/get_department_position_response.dart';

import '../../../../user_page/bloc/user_bloc.dart';
import '../../data/local/crud_department_local_source.dart';
import '../../data/remote/crud_department_remote_source.dart';
import 'crud_department_repository.dart';

class CrudDepartmentRepositoryImpl implements CrudDepartmentRepository {
  final CrudDepartmentRemoteSource _remoteSource;
  final CrudDepartmentLocalSource _localSource;

  CrudDepartmentRepositoryImpl(this._remoteSource, this._localSource);

  @override
  getDepartmenPosition(
      {required Function(List<DataDepartment> dept) onSuccess,
      required Function(dynamic message, dynamic code) onError}) async {
    try {
      var response = await _remoteSource.getDeptPos();
      if (response.code == 401) {
        UserBloc.logout();
      }
      if (response.body?.code == 200) {
        if (response.body?.data != null) {
          onSuccess(response.body!.data!);
        }
      } else {
        onError(response.errorBody?['message'], response.errorBody?['code']);
      }
    } catch (e) {
      onError("Internal Server Error", 500);
    }
  }
  
  @override
  registerDepartment(DataDepartment departmentInputModel, bool isUpdate, {required Function() onSuccess, required Function(String message, int code) onError}) async {
    try {
      var response = await _remoteSource.registerDept(departmentInputModel, isUpdate);
      if (response.code == 401) {
        UserBloc.logout();
      }
      if (response.body?.code == 200) {
        onSuccess();
      } else {
        onError(response.errorBody?['message'], response.errorBody?['code']);
      }
    } catch (e) {
      onError("Internal Server Error", 500);
    }
  }
  
  @override
  deleteUser(int idDepartment, {required Function() onSuccess, required Function(String message, int code) onError}) async {
    try {
      var response = await _remoteSource.deleteDepartment(idDepartment);
      if (response.code == 401) {
        UserBloc.logout();
      }
      if (response.body?.code == 200) {
        onSuccess();
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
