import 'package:ojrek_hris/core/assets/my_enum.dart';
import 'package:ojrek_hris/core/remote/base_remote.dart';
import 'package:dio/dio.dart';
import 'package:ojrek_hris/features/admin_features/crud_announcement_page/data/remote/announcement_response.dart';
import 'package:ojrek_hris/features/admin_features/crud_announcement_page/data/remote/get_department_response.dart';

import '../../../../../core/error/error_result.dart';
import '../../../../../core/remote/dio_model.dart';
import '../../../../../core/remote/response/default_response.dart';

class CrudAnnouncementRemoteSource extends BaseRemote {
  CrudAnnouncementRemoteSource(Dio dio) : super(dio);

  Future<Result<AnnouncementResponse>> getAnnouncements() async {
    var url = "${ApiUrl.announcements}";
    final result = await getMethod(
      url,
      converter: (response) => AnnouncementResponse.fromJson(response),
    );
    return result;
  }

  Future<Result<DefaultResponse>> createUpdateAnnouncements(
      AnnouncementsData announcementData, TypeCrud typeCrud) async {
    var url = "${ApiUrl.announcements}";
    switch (typeCrud) {
      case TypeCrud.CREATE:
        final result = await postMethod(
          url,
          data: announcementData.toJson(),
          converter: (response) => DefaultResponse.fromJson(response),
        );
        return result;
      case TypeCrud.UPDATE:
        final result = await putMethod(
          url + "/${announcementData.id}",
          data: announcementData.toJson(),
          converter: (response) => DefaultResponse.fromJson(response),
        );
        return result;
      case TypeCrud.DELETE:
        final result = await delMethod(
          url + "/${announcementData.id}",
          converter: (response) => DefaultResponse.fromJson(response),
        );
        return result;
    }
  }

  Future<Result<GetDepartmentResponse>> getDepartments() async {
    var url = "${ApiUrl.department}";
    final result = await getMethod(
      url,
      converter: (response) => GetDepartmentResponse.fromJson(response),
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
