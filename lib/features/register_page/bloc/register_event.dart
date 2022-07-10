part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent extends BlocEvent {}

class GetDataRegister extends RegisterEvent {
  final String startDate;
  final String endDate;

  GetDataRegister(this.startDate, this.endDate);
}

class Logout extends RegisterEvent {}
