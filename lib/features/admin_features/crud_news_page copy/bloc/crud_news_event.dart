part of 'crud_news_bloc.dart';

@immutable
abstract class CrudNewsEvent extends BlocEvent {}

class GetDataCrudNews extends CrudNewsEvent {
  final String startDate;
  final String endDate;

  GetDataCrudNews(this.startDate, this.endDate);
}

class Logout extends CrudNewsEvent {}
