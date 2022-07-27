part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends BlocEvent {}

class GetDataLogin extends LoginEvent {
  final String startDate;
  final String endDate;

  GetDataLogin(this.startDate, this.endDate);
}

class LoginProcess extends LoginEvent {
  final BuildContext context;
  final String email;
  final String password;

  LoginProcess(this.email, this.password, this.context);
}

class Logout extends LoginEvent {}
