part of 'crud_department_bloc.dart';

@immutable
abstract class CrudDepartmentEvent extends BlocEvent {}

class GetDepartmenPosition extends CrudDepartmentEvent {
  final BuildContext context;

  GetDepartmenPosition(this.context);
}

class InitEvent extends CrudDepartmentEvent {}

class RegisterDepartment extends CrudDepartmentEvent {
  final BuildContext context;
  final DataDepartment DepartmentInputModel;
  final bool isUpdate;

  RegisterDepartment(this.context, this.DepartmentInputModel, this.isUpdate);
}

class DeleteDepartment extends CrudDepartmentEvent {
  final BuildContext context;
  final int idDepartment;

  DeleteDepartment(this.context, this.idDepartment);
}

class FilterDepartment extends CrudDepartmentEvent {
  final String filter;
  final List<DataDepartment> dataDepartment;

  FilterDepartment(this.filter, this.dataDepartment);
}
