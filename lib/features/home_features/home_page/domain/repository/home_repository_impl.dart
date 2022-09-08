
import 'package:ojrek_hris/features/home_features/home_page/data/remote/announcement_response.dart';
import 'package:ojrek_hris/features/home_features/home_page/data/remote/news_response.dart';
import 'package:ojrek_hris/features/user_page/bloc/user_bloc.dart';

import '../../data/local/home_local_source.dart';
import '../../data/remote/home_remote_source.dart';
import 'home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteSource _remoteSource;
  final HomeLocalSource _localSource;

  HomeRepositoryImpl(this._remoteSource, this._localSource);

  @override
  Future<void> getNews(
      {int? limit, required Function(List<NewsData>? news) onSuccess,
      required Function(String message, int code) onError}) async {
    try {
      var response = await _remoteSource.getNews(limit);
      if (response.code == 401) {
        UserBloc.logout();
      }
      if (response.body?.code == 200) {
        onSuccess(response.body?.data);
      } else {
        onError(response.errorBody?['message'], response.errorBody?['code']);
      }
    } catch (e) {
      onError("Internal Server Error", 500);
    }
  }
  
  @override
  Future<void> getAnnouncements({required Function(List<DataAnnouncements>? news) onSuccess,
      required Function(String message, int code) onError}) async {
    try {
      var response = await _remoteSource.getAnnouncements();
      if (response.code == 401) {
        UserBloc.logout();
      }
      if (response.body?.code == 200) {
        onSuccess(response.body?.data);
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
