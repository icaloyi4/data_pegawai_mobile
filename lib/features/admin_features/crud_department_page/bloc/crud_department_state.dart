part of 'crud_department_bloc.dart';

@immutable
abstract class CrudDepartmentState extends BlocState {}

class LoadingState extends CrudDepartmentState {}

// class SuccessGetDataUser extends UserState {
//   final usr.UserData user;
//   final List<OvertimeData> overtime;

//   SuccessGetDataUser(this.user, this.overtime);
// }
