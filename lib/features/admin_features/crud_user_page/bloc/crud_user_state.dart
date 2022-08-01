part of 'crud_user_bloc.dart';

@immutable
abstract class CrudUserState extends BlocState {}

class LoadingState extends CrudUserState {}

class SuccesGetUser extends CrudUserState {
  final List<usr.Data> dataUser;

  SuccesGetUser(this.dataUser);
}

class ErrorGetUser extends CrudUserState {}

class SuccesGetDeptPos extends CrudUserState {
  final List<dept.Data> dataDept;

  SuccesGetDeptPos(this.dataDept);
}

class ErrorDeptPos extends CrudUserState {}

// class SuccessGetDataUser extends UserState {
//   final usr.UserData user;
//   final List<OvertimeData> overtime;

//   SuccessGetDataUser(this.user, this.overtime);
// }
