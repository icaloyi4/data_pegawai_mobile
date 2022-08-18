import 'package:ojrek_hris/core/assets/my_cons.dart';

import '../../data/remote/news_response.dart';

abstract class CrudNewsRepository {
  Future<void> getNews(
      {int? limit,
      required Function(List<NewsData>? news) onSuccess,
      required Function(String message, int code) onError});
  Future<void> crudNews(
      {required NewsData newsData,
      required TypeCrud typeCrud,
      required Function(List<NewsData>? news) onSuccess,
      required Function(String message, int code) onError});
  // Future<void> getDataUser(
  //     {Function(usr.UserData user) onSuccess,
  //     Function(String message) onError});

  // Future<void> getOvertime(
  //     {String startDate,
  //     String endDate,
  //     Function(List<OvertimeData> overtimeList) onSuccess,
  //     Function(String message) onError}) {}
}
