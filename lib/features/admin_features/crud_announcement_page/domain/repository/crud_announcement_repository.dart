import 'package:ojrek_hris/features/admin_features/crud_announcement_page/data/remote/announcement_response.dart';
import 'package:ojrek_hris/features/admin_features/crud_announcement_page/data/remote/get_department_response.dart';

import '../../../../../core/assets/my_enum.dart';

abstract class CrudAnnouncementRepository {
  Future<void> getAnnouncements(
      {required Function(List<AnnouncementsData>? news) onSuccess,
      required Function(String message, int code) onError});
  Future<void> crudAnnouncement(
      {required AnnouncementsData announcementsData,
      required TypeCrud typeCrud,
      required Function(List<AnnouncementsData>? announcement) onSuccess,
      required Function(String message, int code) onError});

  Future<void> getDepartment(
      {required Function(List<DepartmentData> department) onSuccess,
      required Function(dynamic message, dynamic code) onError});

  // Future<void> getDataUser(
  //     {Function(usr.UserData user) onSuccess,
  //     Function(String message) onError});

  // Future<void> getOvertime(
  //     {String startDate,
  //     String endDate,
  //     Function(List<OvertimeData> overtimeList) onSuccess,
  //     Function(String message) onError}) {}
}
