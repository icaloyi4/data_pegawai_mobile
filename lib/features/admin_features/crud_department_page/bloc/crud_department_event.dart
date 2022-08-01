part of 'crud_department_bloc.dart';

@immutable
abstract class CrudDepartmentEvent extends BlocEvent {}

class GetDataCrudDepartment extends CrudDepartmentEvent {
  final String startDate;
  final String endDate;

  GetDataCrudDepartment(this.startDate, this.endDate);
}

class Logout extends CrudDepartmentEvent {}
