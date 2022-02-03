part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends BlocEvent {}

class GetDataUser extends UserEvent {
  final String startDate;
  final String endDate;

  GetDataUser(this.startDate, this.endDate);
}

class Logout extends UserEvent {}
