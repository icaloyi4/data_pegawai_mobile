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

class SuccessGetNews extends HomeState {
  final List<NewsData>? listNews;

  SuccessGetNews(this.listNews);
}

class ErrorGetNews extends HomeState {}

class SuccessGetAnnouncement extends HomeState {
  final List<DataAnnouncements>? listAnnouncements;

  SuccessGetAnnouncement(this.listAnnouncements);
}

class ErrorGetAnnouncement extends HomeState {}
// class SuccessGetDataUser extends UserState {
//   final usr.UserData user;
//   final List<OvertimeData> overtime;

//   SuccessGetDataUser(this.user, this.overtime);
// }
