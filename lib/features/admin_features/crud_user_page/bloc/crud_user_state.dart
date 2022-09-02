part of 'crud_user_bloc.dart';

@immutable
abstract class CrudUserState extends BlocState {}

class LoadingState extends CrudUserState {}

class SuccesGetUser extends CrudUserState {
  final List<usr.DataUserRegister> dataUser;

  SuccesGetUser(this.dataUser);
}

class SuccesGetUserFilter extends CrudUserState {
  final List<usr.DataUserRegister> dataUser;

  SuccesGetUserFilter(this.dataUser);
}

class ErrorGetUser extends CrudUserState {}

class SuccesGetDeptPos extends CrudUserState {
  final List<dept.DataDepartment> dataDept;

  SuccesGetDeptPos(this.dataDept);
}

class ErrorRegisterUser extends CrudUserState {}

class ErrorDeleteUser extends CrudUserState {}

class SuccesRegisterUser extends CrudUserState {}

class ErrorDeptPos extends CrudUserState {}

class InitState extends CrudUserState {}

// class SuccessGetDataUser extends UserState {
//   final usr.UserData user;
//   final List<OvertimeData> overtime;

//   SuccessGetDataUser(this.user, this.overtime);
// }
