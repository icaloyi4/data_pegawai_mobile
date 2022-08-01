part of 'crud_announcement_bloc.dart';

@immutable
abstract class CrudAnnouncementState extends BlocState {}

class LoadingState extends CrudAnnouncementState {}

// class SuccessGetDataUser extends UserState {
//   final usr.UserData user;
//   final List<OvertimeData> overtime;

//   SuccessGetDataUser(this.user, this.overtime);
// }
