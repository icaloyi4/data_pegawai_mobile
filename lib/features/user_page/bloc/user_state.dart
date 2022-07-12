part of 'user_bloc.dart';

@immutable
abstract class UserState extends BlocState {}

class LoadingState extends UserState {}

// class SuccessGetDataUser extends UserState {
//   final usr.UserData user;
//   final List<OvertimeData> overtime;

//   SuccessGetDataUser(this.user, this.overtime);
// }
