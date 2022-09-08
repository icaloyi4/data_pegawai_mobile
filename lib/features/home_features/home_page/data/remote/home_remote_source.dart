import 'package:ojrek_hris/core/remote/base_remote.dart';
import 'package:dio/dio.dart';

import '../../../../../core/assets/my_cons.dart';
import '../../../../../core/error/error_result.dart';
import '../../../../../core/remote/dio_model.dart';
import 'announcement_response.dart';
import 'news_response.dart';
class HomeRemoteSource extends BaseRemote {
  HomeRemoteSource(Dio dio) : super(dio);

  Future<Result<NewsResponse>> getNews(int? limit) async {

    var url = "${ApiUrl.news}${(limit!=null)?"?limit=$limit":""}";
    final result = await getMethod(
      url,
      converter: (response) => NewsResponse.fromJson(response),
    );
    return result;
  }

  Future<Result<AnnouncementResponse>> getAnnouncements() async {

    var url = "${ApiUrl.announcements}?department_id=${MyCons.dataUser?.user?.departmentId}";
    final result = await getMethod(
      url,
      converter: (response) => AnnouncementResponse.fromJson(response),
    );
    return result;
  }
}
