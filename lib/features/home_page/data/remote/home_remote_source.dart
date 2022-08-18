import 'package:ojrek_hris/core/remote/base_remote.dart';
import 'package:dio/dio.dart';
import 'package:ojrek_hris/features/home_page/data/remote/news_response.dart';

import '../../../../core/error/error_result.dart';
import '../../../../core/remote/dio_model.dart';

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
}
