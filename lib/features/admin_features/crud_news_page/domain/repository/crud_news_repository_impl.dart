import 'package:ojrek_hris/core/assets/my_cons.dart';
import 'package:ojrek_hris/features/admin_features/crud_news_page/data/remote/news_response.dart';

import '../../../../../core/assets/my_enum.dart';
import '../../../../../core/base/base_remote_repository.dart';
import '../../../../user_page/bloc/user_bloc.dart';
import '../../data/local/crud_news_local_source.dart';
import '../../data/remote/crud_news_remote_source.dart';
import 'crud_news_repository.dart';

class CrudNewsRepositoryImpl extends BaseRemoteRepository
    implements CrudNewsRepository {
  final CrudNewsRemoteSource _remoteSource;
  final CrudNewsLocalSource _localSource;

  CrudNewsRepositoryImpl(this._remoteSource, this._localSource);

  @override
  Future<void> getNews(
      {int? limit,
      required Function(List<NewsData>? news) onSuccess,
      required Function(String message, int code) onError}) async {
    var response = await _remoteSource.getNews(limit);
    responseProcess(response, onSuccess, onError);
  }

  @override
  Future<void> crudNews(
      {required NewsData newsData,
      required TypeCrud typeCrud,
      required Function(List<NewsData>? news) onSuccess,
      required Function(String message, int code) onError}) async {
    var response = await _remoteSource.createUpdateNews(newsData, typeCrud);
    responseProcess(response, onSuccess, onError);
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
