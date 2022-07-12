part of 'home_bloc.dart';

@immutable
abstract class HomeState extends BlocState {}

class LoadingState extends HomeState {}

// class SuccessGetDataUser extends UserState {
//   final usr.UserData user;
//   final List<OvertimeData> overtime;

//   SuccessGetDataUser(this.user, this.overtime);
// }
