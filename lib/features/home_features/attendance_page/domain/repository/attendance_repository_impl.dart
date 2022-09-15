import 'package:ojrek_hris/features/home_features/attendance_page/data/remote/check_in_out.dart';
import 'package:ojrek_hris/features/home_features/attendance_page/data/remote/get_attendance_response.dart';

import '../../../../user_page/bloc/user_bloc.dart';
import '../../data/local/attendance_local_source.dart';
import '../../data/remote/attendance_remote_source.dart';
import 'attendance_repository.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  final AttendanceRemoteSource _remoteSource;
  final AttendanceLocalSource _localSource;

  AttendanceRepositoryImpl(this._remoteSource, this._localSource);

  @override
  Future<void> getAttendance(
      {required Function(List<AttendanceData> attendanceList) onSuccess,
      required Function(String message, int code) onError}) async {
    try {
      var response = await _remoteSource.getAttendance();
      if (response.code == 401) {
        UserBloc.logout();
      }
      if (response.body?.code == 200) {
        onSuccess(response.body!.data);
      } else {
        onError(response.errorBody?['message'], response.errorBody?['code']);
      }
    } catch (e) {
      onError("Internal Server Error", 500);
    }
  }

  @override
  Future<void> checkInOut(CheckInOutModel data,
      {required Function() onSuccess,
      required Function(dynamic code, dynamic message) onError}) async {
    try {
      var response = await _remoteSource.checkInOut(data);
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
  // Future<void> checkInOut(CheckInOutModel data,{required Function() onSuccess, required Function(dynamic code, dynamic message) onError}) async {
  //   try {
  //     var response = await _remoteSource.checkInOut();
  //     if (response.code == 401) {
  //       UserBloc.logout();
  //     }
  //     if (response.body?.code == 200) {
  //       onSuccess(response.body!.data);
  //     } else {
  //       onError(response.errorBody?['message'], response.errorBody?['code']);
  //     }
  //   } catch (e) {
  //     onError("Internal Server Error", 500);
  //   }
  // }

  // @override
  // Future<void> logout(
  //     {Function()? onSuccess,
  //     Function(String message, int code)? onError}) async {
  //   try {
  //     var response = await _remoteSource.logout();
  //     if (response.body?.code == 200) {
  //       onSuccess!();
  //     } else {
  //       onError!(response.errorBody?['message'], response.errorBody?['code']);
  //     }
  //   } catch (e) {
  //     onError!("Internal Server Error", 500);
  //   }
  // }

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
