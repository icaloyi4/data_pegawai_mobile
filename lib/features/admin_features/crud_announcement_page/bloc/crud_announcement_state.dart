part of 'crud_announcement_bloc.dart';

@immutable
abstract class CrudAnnouncementState extends BlocState {}

class LoadingState extends CrudAnnouncementState {}

class SuccessGetAnnouncements extends CrudAnnouncementState {
  final List<AnnouncementsData>? listAnnouncements;

  SuccessGetAnnouncements(this.listAnnouncements);
}

class SuccesGetDept extends CrudAnnouncementState {
  final List<DepartmentData> dataDept;

  SuccesGetDept(this.dataDept);
}

class ErrorDept extends CrudAnnouncementState {}

class ErrorGetAnnouncements extends CrudAnnouncementState {}

class SuccessCreateUpdateAnnouncements extends CrudAnnouncementState {}

class ErrorCreateUpdateAnnouncements extends CrudAnnouncementState {}

class InitState extends CrudAnnouncementState {}

// class SuccessGetDataUser extends UserState {
//   final usr.UserData user;
//   final List<OvertimeData> overtime;

//   SuccessGetDataUser(this.user, this.overtime);
// }
