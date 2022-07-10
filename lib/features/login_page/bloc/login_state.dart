part of 'login_bloc.dart';

@immutable
abstract class LoginState extends BlocState {}

class LoadingState extends LoginState {}

// class SuccessGetDataUser extends UserState {
//   final usr.UserData user;
//   final List<OvertimeData> overtime;

//   SuccessGetDataUser(this.user, this.overtime);
// }
