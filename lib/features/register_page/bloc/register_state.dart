part of 'register_bloc.dart';

@immutable
abstract class RegisterState extends BlocState {}

class LoadingState extends RegisterState {}

// class SuccessGetDataUser extends UserState {
//   final usr.UserData user;
//   final List<OvertimeData> overtime;

//   SuccessGetDataUser(this.user, this.overtime);
// }
