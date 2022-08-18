part of 'crud_news_bloc.dart';

@immutable
abstract class CrudNewsState extends BlocState {}

class LoadingState extends CrudNewsState {}

class SuccessGetNews extends CrudNewsState {
  final List<NewsData>? listNews;

  SuccessGetNews(this.listNews);
}

class ErrorGetNews extends CrudNewsState {}

class SuccessCreateUpdateNews extends CrudNewsState {}

class ErrorCreateUpdateNews extends CrudNewsState {}

class InitState extends CrudNewsState {}
// class SuccessGetDataUser extends UserState {
//   final usr.UserData user;
//   final List<OvertimeData> overtime;

//   SuccessGetDataUser(this.user, this.overtime);
// }
