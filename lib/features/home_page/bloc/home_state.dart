part of 'home_bloc.dart';

@immutable
abstract class HomeState extends BlocState {}

class LoadingState extends HomeState {}

class ErrorState extends HomeState {
  final String message;

  ErrorState(this.message);
}

class GetWeather extends HomeState {
  final Weather weather;

  GetWeather(this.weather);
}

// class SuccessGetDataUser extends UserState {
//   final usr.UserData user;
//   final List<OvertimeData> overtime;

//   SuccessGetDataUser(this.user, this.overtime);
// }
