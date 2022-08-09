part of 'crud_company_bloc.dart';

@immutable
abstract class CrudCompanyState extends BlocState {}

class LoadingState extends CrudCompanyState {}

class InitState extends CrudCompanyState {}

class SuccesUpdateCompany extends CrudCompanyState {}

class ErrorUpdateCompany extends CrudCompanyState {}

// class SuccessGetDataUser extends UserState {
//   final usr.UserData user;
//   final List<OvertimeData> overtime;

//   SuccessGetDataUser(this.user, this.overtime);
// }
