import 'package:ojrek_hris/features/home_page/data/remote/news_response.dart';

abstract class HomeRepository {
  Future<void> getNews(
      {int? limit, required Function(List<NewsData>? news) onSuccess,
      required Function(String message, int code) onError});

  // Future<void> getOvertime(
  //     {String startDate,
  //     String endDate,
  //     Function(List<OvertimeData> overtimeList) onSuccess,
  //     Function(String message) onError}) {}
}
