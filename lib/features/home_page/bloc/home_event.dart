part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends BlocEvent {}

class GetDataHome extends HomeEvent {
  final String startDate;
  final String endDate;

  GetDataHome(this.startDate, this.endDate);
}

class Logout extends HomeEvent {}

class InitWeather extends HomeEvent {}
