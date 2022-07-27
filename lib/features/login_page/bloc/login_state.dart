part of 'login_bloc.dart';

@immutable
abstract class LoginState extends BlocState {}

class InitState extends LoginState {}

class LoadingState extends LoginState {}

class SuccessLogin extends LoginState {
  final DataUser? userData;

  SuccessLogin(this.userData);
}

class ErrorLogin extends LoginState {
  ErrorLogin();
}

// class SuccessGetDataUser extends UserState {
//   final usr.UserData user;
//   final List<OvertimeData> overtime;

//   SuccessGetDataUser(this.user, this.overtime);
// }
