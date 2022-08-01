part of 'crud_news_bloc.dart';

@immutable
abstract class CrudNewsState extends BlocState {}

class LoadingState extends CrudNewsState {}

// class SuccessGetDataUser extends UserState {
//   final usr.UserData user;
//   final List<OvertimeData> overtime;

//   SuccessGetDataUser(this.user, this.overtime);
// }
