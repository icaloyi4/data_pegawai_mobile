part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends BlocEvent {}

class GetNews extends HomeEvent {
  final BuildContext context;
  int? limit;

  GetNews(this.context, {this.limit});
}

class Logout extends HomeEvent {}

class InitWeather extends HomeEvent {}
