part of 'crud_department_bloc.dart';

@immutable
abstract class CrudDepartmentState extends BlocState {}

class LoadingState extends CrudDepartmentState {}
class SuccesGetDepartmentFilter extends CrudDepartmentState {
  final List<DataDepartment> dataDepartment;

  SuccesGetDepartmentFilter(this.dataDepartment);
}

class ErrorGetDepartment extends CrudDepartmentState {}

class SuccesGetDeptPos extends CrudDepartmentState {
  final List<DataDepartment> dataDept;

  SuccesGetDeptPos(this.dataDept);
}

class ErrorRegisterDepartment extends CrudDepartmentState {}

class ErrorDeleteDepartment extends CrudDepartmentState {}

class SuccesRegisterDepartment extends CrudDepartmentState {}

class ErrorDeptPos extends CrudDepartmentState {}

class InitState extends CrudDepartmentState {}

// class SuccessGetDataUser extends DepartmentState {
//   final usr.DepartmentData Department;
//   final List<OvertimeData> overtime;

//   SuccessGetDataDepartment(this.Department, this.overtime);
// }
