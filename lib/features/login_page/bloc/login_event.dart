part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends BlocEvent {}

class GetDataLogin extends LoginEvent {
  final String startDate;
  final String endDate;

  GetDataLogin(this.startDate, this.endDate);
}

class Logout extends LoginEvent {}
