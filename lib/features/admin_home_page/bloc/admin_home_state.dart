part of 'admin_home_bloc.dart';

@immutable
abstract class AdminHomeState extends BlocState {}

class LoadingState extends AdminHomeState {}

// class SuccessGetDataUser extends UserState {
//   final usr.UserData user;
//   final List<OvertimeData> overtime;

//   SuccessGetDataUser(this.user, this.overtime);
// }
