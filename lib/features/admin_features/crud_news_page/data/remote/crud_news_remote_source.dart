import 'package:ojrek_hris/core/assets/my_cons.dart';
import 'package:ojrek_hris/core/remote/base_remote.dart';
import 'package:dio/dio.dart';
import 'package:ojrek_hris/core/remote/response/default_response.dart';

import '../../../../../core/assets/my_enum.dart';
import '../../../../../core/error/error_result.dart';
import '../../../../../core/remote/dio_model.dart';
import 'news_response.dart';

class CrudNewsRemoteSource extends BaseRemote {
  CrudNewsRemoteSource(Dio dio) : super(dio);

  Future<Result<NewsResponse>> getNews(int? limit) async {
    var url = "${ApiUrl.news}${(limit != null) ? "?limit=$limit" : ""}";
    final result = await getMethod(
      url,
      converter: (response) => NewsResponse.fromJson(response),
    );
    return result;
  }

  Future<Result<DefaultResponse>> createUpdateNews(
      NewsData newsData, TypeCrud typeCrud) async {
    var url = "${ApiUrl.news}";
    switch (typeCrud) {
      case TypeCrud.CREATE:
        final result = await postMethod(
          url,
          data: newsData.toJson(),
          converter: (response) => DefaultResponse.fromJson(response),
        );
        return result;
      case TypeCrud.UPDATE:
        final result = await putMethod(
          url + "/${newsData.id}",
          data: newsData.toJson(),
          converter: (response) => DefaultResponse.fromJson(response),
        );
        return result;
      case TypeCrud.DELETE:
        final result = await delMethod(
          url + "/${newsData.id}",
          converter: (response) => DefaultResponse.fromJson(response),
        );
        return result;
    }
  }

  Future<Result<DefaultResponse>> deleteNews(
      NewsData newsData, bool isUpdate) async {
    var url = "${ApiUrl.news}/${newsData.id}";
    final result = await delMethod(
      url,
      converter: (response) => DefaultResponse.fromJson(response),
    );
    return result;
  }

  // Future<Result<OvertimeResponse>> getOvertime(
  //     String startDate, String endDate, int id) async {
  //   var url =
  //       "${ApiUrl.getOvetimeBaseId}$id?enddate=${endDate}&startdate=${startDate}";
  //   final result = await getMethod(
  //     url,
  //     converter: (response) => OvertimeResponse.fromJson(response),
  //   );
  //   return result;
  // }
}
