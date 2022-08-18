part of 'crud_news_bloc.dart';

@immutable
abstract class CrudNewsEvent extends BlocEvent {}

class GetNews extends CrudNewsEvent {
  final BuildContext context;
  int? limit;

  GetNews(this.context, {this.limit});
}

class CRUDNews extends CrudNewsEvent {
  final BuildContext context;
  final TypeCrud typeCrud;
  final NewsData newsData;

  CRUDNews(this.context, {required this.typeCrud, required this.newsData});
}

class Logout extends CrudNewsEvent {}
