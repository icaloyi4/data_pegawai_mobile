import 'package:ojrek_hris/core/base/base_remote_repository.dart';
import 'package:ojrek_hris/features/admin_features/crud_announcement_page/data/remote/announcement_response.dart';
import 'package:ojrek_hris/features/admin_features/crud_announcement_page/data/remote/get_department_response.dart';

import '../../../../../core/assets/my_enum.dart';
import '../../data/local/crud_announcement_local_source.dart';
import '../../data/remote/crud_announcement_remote_source.dart';
import 'crud_announcement_repository.dart';

class CrudAnnouncementRepositoryImpl extends BaseRemoteRepository
    implements CrudAnnouncementRepository {
  final CrudAnnouncementRemoteSource _remoteSource;
  final CrudAnnouncementLocalSource _localSource;

  CrudAnnouncementRepositoryImpl(this._remoteSource, this._localSource);

  @override
  Future<void> getAnnouncements(
      {required Function(List<AnnouncementsData>? news) onSuccess,
      required Function(String message, int code) onError}) async {
    var response = await _remoteSource.getAnnouncements();
    responseProcess(response, onSuccess, onError);
  }

  @override
  Future<void> crudAnnouncement(
      {required AnnouncementsData announcementsData,
      required TypeCrud typeCrud,
      required onSuccess,
      required Function(String message, int code) onError}) async {
    var response = await _remoteSource.createUpdateAnnouncements(
        announcementsData, typeCrud);
    responseProcess(response, onSuccess, onError);
  }

  @override
  Future<void> getDepartment({required Function(List<DepartmentData> department) onSuccess, required Function(dynamic message, dynamic code) onError}) async {
    var response = await _remoteSource.getDepartments();
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
